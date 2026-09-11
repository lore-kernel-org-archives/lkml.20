Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AA13DC4C9;
	Fri, 11 Sep 2026 02:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093552; cv=none; b=gDj51eGUW3I5AO6xfdNm/du8X2qzDeN2QHZjyATowOWhi1OjNH/Rmg+ffALerXm5VnV5BzEoVVtFCHzIuWeQ4Pyxum0Lbid4ZGEnjDlmqvDXxNUJBg64GARyvt5W6UuV75EHI5bieadyGVFdWIGPMENGlxd/7MRX1ZC7ekBL91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093552; c=relaxed/simple;
	bh=fd7tGXG5eP2WB7nKkOWrXO3rXYzsPshKvD7SS5wc9Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iVXWIuzDq9LCYQQDOy3GrhFA941VgKT4syPfSYtdgEidSEICicXokd4pX+atrPpZKptmDym5h9fIdG8YXR9a68JQo4CUG2bp6bG2luFIupQMQYjnpNPj2KvmwGeXH3JNmI7UCR1ZokJ4Ii4rwZMx+SwKF/7VVYsbp/WreV7+OIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6O4XWDL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6O4XWDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EBC1F00893;
	Fri, 11 Sep 2026 02:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093551;
	bh=keC+4lCNgl4h+EQPTrZts10L19jjOc6Q/9p2LMM/nus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j6O4XWDLPa5xjkXrJXJ5BY6+4ZlXXXd255ClQeSTHA3ZfFYdAzMTXFuZPWEn1h3oo
	 iXqhdK/W0dvTioV9KwvmSN9qQWRcepSCdgtsMKkwYI4ijFvzkI5om+EaU/gWZjlUXm
	 38cCRWQkbNmO6/ToUVyw/PZb1iRRDbtm0GAqlZ/k4vOHEEAuj3Spf3cN7x4EpB3Z8q
	 IxCeoZNlyBv3GkQ2nWNcCPlZ+dqJoV90HDDLVjvJE12kvWHKuz84R1pIYsyl9CZEhk
	 EB5JmzLNp55A8SeusV1Ojv/JAQ7hXK2pem1j37xD5jUq1iuv67pC6j2X8KlJaZFEoV
	 p8P4StmyBsv8w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Abel as reviewer for linux-arm-msm
Date: Thu, 10 Sep 2026 21:25:28 -0500
Message-ID: <178909353855.920241.16844433526564838630.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902-maintainers-qcom-add-reviewer-v1-1-82d6126df520@oss.qualcomm.com>
References: <20260902-maintainers-qcom-add-reviewer-v1-1-82d6126df520@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Sep 2026 14:57:06 +0300, Abel Vesa wrote:
> As agreed with Bjorn and Konrad off-list, I'm stepping up as reviewer
> for Qualcomm SoCs support.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: add Abel as reviewer for linux-arm-msm
      commit: 8c66e420c29a0fa8589e14ee357382742aba88e5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
