Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285312;
	b=s8w0HRLHOBP1EROUUPk5snbhm7tQySqU3pW5MWNGMr0EZ/uO6G50r0Ob+3sv1p5VnIcR
	 aif9ytjX3jJg/ZH+JdwWfc+ja2ODBs5XieYz4Pg7lpkGuUGOmUg+q1yp3Dhdi6CKWuF5B
	 +fNzl4ceAskEYV2uGZE/aJHf499FrYHCSKFE39h9Ia+hAiro5296HWDpL5jJqo1h+uNQW
	 V43BJutFk3bL3bKecTMbs3zavHPFfu3XzNEr/N6wS/CKQL/OCksJlMeKmQTrngEGuzjHO
	 Gp8IpSFj8Clp1tSZOS8Y5HIh6DEYiSaRlk1lf3a/56ZxRCeBhTlZH0XAQbZL4quMrFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285312;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9bvrjZ1k7IKq4wYbXNo9aw+2Rdfg40oY4feE7Aj/EnU=;
	b=ROIaj9i2gCIg8ALKkBTItQNbAVNpWgJOhNpTs59g967L8RF6+1dpc44gQPi/C/JxDehk
	 ha6GXE8BHZNd5I02brmZXkdFjz65GbVl3wtWJ/YnrrKL4FmCYFPdMwVUrwhnoPsbsnP+v
	 7xUUYAeMhlDUkV5tpJSQ29a67pXqK3DWvGZem8hTQFczg+z49E3sRzCzf0psx+fA1aYGM
	 w09YhGKaMjXWdgmPpPh24As0JCOWC/2Znl/mDsRJt2RxQ6Qia4QBCmk+xxh4pvLI3kVBR
	 1BikTELUpy1l9JFqgSWFKhkTV94CFuH5cjYp3MTNFC8JcduuXnWMMp8kf0zQc4TUz7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkuJMOH7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78405606DEA0;
	Tue, 10 Nov 2026 04:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkuJMOH7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEF71F008A6;
	Tue, 10 Nov 2026 04:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285312;
	bh=9bvrjZ1k7IKq4wYbXNo9aw+2Rdfg40oY4feE7Aj/EnU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nkuJMOH7YfLIaNdXwuHVkr/LibtVEcRPH+wB+LczTyuxqIUw01xxzYSpAZfvL833B
	 9U/1T1e+IF6VA8B+laeOJqDXwgPFvPt2fB0cWnahWAFVYUjxS3/JtFbDrop/23L9Tu
	 EdmddwWymkvzUG21HR0DcHw1pu9kRkMVEMs4siLCU50hlIgdeQkYd7lulhDekfF+BB
	 w2YngWVGqy05icn9r1QhEZSgZ4FSBUvXiJS5yXGy+vpBC+UBRlLIGuIgij5aqFkfyh
	 Bi7YbuuNGsLEtzmzbLL9rdEgLuLEQcd3BdsmpjixKv6cOZ1VkByWKYhlmr/EWmGP2+
	 n7XwQinL5gTNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Subject: Re: [PATCH] firmware: qcom: Remove redundant dev_err_probe()
Date: Mon,  9 Nov 2026 22:34:53 -0600
Message-ID: <179428529331.1061455.4422564988297906492.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713131940.355559-1-panchuang@vivo.com>
References: <20260713131940.355559-1-panchuang@vivo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jul 2026 21:19:39 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err_probe() calls.

Applied, thanks!

[1/1] firmware: qcom: Remove redundant dev_err_probe()
      commit: 9859c1f72a9aa22f3f8c579ebdb428e97fb56880
[1/1] firmware: tegra: Remove redundant dev_err()
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
