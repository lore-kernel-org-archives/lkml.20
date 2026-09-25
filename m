Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899C4A6CF5;
	Fri, 25 Sep 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345726; cv=none; b=io4wVJmZzFZVz/7rXq4wX4W81S4mVlppV81ADZMgRiSNkan5TVSRoNahtZkmBAysl/3qSd5CQSMBO3NEWVrotEsQlpBzTkoAoJwdrLHypKMFowPIww8FQcKVIGwFhcl7JFhbOmeC/Vi4QZ0JIbsenfclcZddn5eft9n+Ykex8wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345726; c=relaxed/simple;
	bh=LexVgbkJxW1BfnranEfnffdHVg/y0L+PeGXa1JqA3UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJEUGQxDQHJy5DRtaVfI9fPRaAzNOCsG56DZbkhdgEw8IwIJ7I7kW1/n290qeQdPC4nsYZNznG2MpmhL3Yj5njMbGRHN3jMwVL1x8XKFf1Ge3ii5GIRJN3boh2UVwrfujQ1S9NEZtYKwXbNGFkq47stbzSheFwz4/YgAwErnHP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfZIuIBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfZIuIBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FD21F00898;
	Fri, 25 Sep 2026 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790345723;
	bh=fEde2YnOBOmuiAHiL5BvPDTyxR6fOxVTAh6sfgNSrN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WfZIuIBosnNQ9YBORu6GAdNG74GBXtVvLiWqqhVcvWX6OkCmv8fmG6PqO0XCooY7N
	 1UCYpHVQKkiWnh07BWaDnNd4mU/kn8uz1yDbBr91CuvO7IRRbn78p6g7d1T7XsuBQB
	 8NFoMLg8FhEPro6yR9ePGDOOJedoaz1qUtaaW3u0QoJKoLrwJ16KjA3irLb/WIYGB9
	 eY1wkh1MIlQoexU6cYMWzutsYJKX1jgr7qYg3cSeSMemX1Q3C1nyG9oxwHFSEVSyri
	 TU94b1H4XDSvC3ZnNTazklqR8ikb4FsNbRj/4cw3P5XHmCtNWutInxP1jQTp/rqDU/
	 BoVC7k9Zfe/Kg==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: (subset) [PATCH v2 1/3] firmware: qcom: tzmem: Use DO_ONCE_SLEEPABLE() in qcom_tzmem_enable()
Date: Fri, 25 Sep 2026 09:15:07 -0500
Message-ID: <179034566340.1095282.16578515917695918546.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


On Tue, 22 Sep 2026 01:26:34 +0530, Mukesh Ojha wrote:
> qcom_tzmem_enable() is called from qcom_scm_probe() in a sleepable process
> context. The helper it wraps, qcom_tzmem_init(), calls
> qcom_scm_shm_bridge_enable() -> qcom_scm_call(), which invokes
> might_sleep() and later acquires the qcom_scm_lock mutex via
> __scm_smc_do().
> 
> DO_ONCE() takes the once_lock spinlock with IRQs disabled, so invoking
> qcom_tzmem_init() from inside DO_ONCE() runs a sleepable call chain in
> atomic context. CONFIG_DEBUG_ATOMIC_SLEEP=y catches this on boot:
> 
> [...]

Applied, thanks!

[3/3] firmware: qcom_scm: align PAS resource table retry
      commit: 8b5af44f53ad08ebdf1872c36ae2b998bf22bb72

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
