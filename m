Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636859;
	b=jNO+iUttRcQDgHgRRHxYwwGlaEPpKVOnPcbVZC3wR2hdueYXs0i1WsPtPVgvSzm/4tdn
	 BiKvvhH0C9zhQmpKON/IiA7v8cYOBPRUtZrqIcy/YNj8BLpY8pigsOE2paXzT2kuQsYk+
	 YwoVdF6cmxfDwNDw0DzPl7YaQMEUfI/MmKKo5yfFOAGv6I4h+UiZgJAhLPv7crmEiBTsW
	 Li4B2gvpecKM5cNvGwBOhnke/OnvkpdmFrI5aS/kT2DATrGuWCsw12tFhc2aENiAOg287
	 /ekBwLqlnt6QmdGZehrWq2PzcWonNjZe1+sakZdQ1/6pelAdFQNtJHD/qMsbgCCHvBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636859;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PKuC3iMi5KaK8WbeK6ZU4LLYWX1FwZvdmJtAaEeCpV8=;
	b=xBfWx0pVoT7ebHwSKTb7UxQCveNsiJCn+xZGS1QXOmKJxcOMnFfX8yZTz12RdvtOO/i/
	 dWR6FXru5+TxAxHeHL1EkbJMqUrxYwGK6mPYY6motzAziIz3Z2dDC8qzfkQRBSKT0cwbx
	 kOKuuyBcPdEJaMlaM28CiS9GTMaaTLai2bZN9kUdafQ4xvnpo1NBbKle0HJpEuoDhdsv7
	 nLc1cpSrttuLS2dldrOVXtlB03mCY2fZgJvveJ4yCiHVJ4wxU1PDpG7Zb/bWuXWY53+wF
	 ITQ22IqPXFKftkHMaAeQmH+VTODrULNN7aB/bWY1HrTBJzwnJWRxgK2zOXZVpsxHLlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=PrTie4mU;
	arc=none smtp.remote-ip=203.205.221.209
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA09D609D815;
	Mon,  2 Nov 2026 16:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA09D609D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=PrTie4mU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793636849;
	bh=PKuC3iMi5KaK8WbeK6ZU4LLYWX1FwZvdmJtAaEeCpV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PrTie4mUZzN2LVBRARVREVFgMwA8W+cv+IRrTHsdeLdlAdOcCFm8LlCQI+StW2xD8
	 G/s0R5SXbeCSL/N6ra2b5tzKVLxC4aayBor4fr9Dpl+BLVue8jEFBLgc2UsKrLRris
	 wPfs5OvEI6hDC6rcygLmzlcGk7UAmAaMxTH5+jxY=
Received: from ubuntu.lan ([223.160.115.26])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 6D79A0E4; Tue, 03 Nov 2026 00:27:23 +0800
X-QQ-mid: xmsmtpt1793636843tf6zz6evx
Message-ID: <tencent_E2B164FCF1BB7BD1B37CF08EAF0F0F0F9D07@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5FnxiiewIld6jP5B/Ss9NHPxvnaRnFXNVl3mSnQRrxKISvmY1aQ
	 DH1YQwoc5j9k4H8dl7KJ5XP433800k2cQbUefyIKXMQ3jzNZAOKLqqYltXVbipz400Rx0AHZHwsr
	 TEs2XQScw5wlaTamG6Pc8k90VQSB4MNJDuQ6Yxww0TAeULPEXMRFGd7ro0OU+YFaKIdOGMP0NGqG
	 71UIfNyoerDWHWzJgqUbbW/30jlFByoGe+WAzjKHAW/ECO6OV6HlJLc1nADmb7s13fRhOEZZVEiY
	 el5D6yWhdE6BKFSDZIVedE5k72UisIdLVx4YpOwueKBSjPXOfF1QQ7lUt5z57KcY1FaYAF8coHwR
	 GDR1FR7VQjqDmilWcAgEKmoFvar9Jg8W6llmGKh1m6c9FumurSqrREm3z8iz8IoROr2/QAHn09xH
	 Fm0DDVgupqIJ6uCqtlGsZvzybBkog3SGPaYMmPWykojLA/09JIqyZao0pFcSa9g98O9N/E+jUcqE
	 ie8XRYH6xbkNU+uWYHdvL4slu3r9UGaN2EaSvWwwV/R4gPVCuLm0ASIg7NLrXv6DNmFGNYXTQcDk
	 4VztYWeS1yLt7x0IyDipKFPxDxIinfr7b1mAJrGCwoj2C73M+geB8CZ2nweui9NcundvL+T1BN2Z
	 GKpEvcdJMZRJ4QO7U73Bvd1+NfQ48BymT8X0sLYYhsfaLXeLR7SI5jbVRjUIMbEOBNekQj7lRlZz
	 Dk7F3vBWSL0yUO3Ldw388bziA0fxYskMOAjdD6SO30GrMnyS+dOLP+pajF5VKWKbZq07BZ94B3ob
	 2fGWHck+xESY3vgPqD8Ztwtzs9T6jzMnSCD+8f0h6QSMwIUrgP+tYmoo5CtpB7FtE4T2xg09DW9q
	 jgmBp/vBsq3VFx7QGIyr3bXTBEBgXsy+UeizjFV5PIF2/axeoP1t+MVVb5dMTpyvHE4yYLvMpw2m
	 Rrx9f6F3Y12BaL0y62YyS4777vkwAiFNL2Sk9/qLxcKLs1+Cem6PE+K9P1DThcEpSQ94OB/Ml9FD
	 6pXd1r+OswsxpL6K0zn9uNSmtz1ya/igUhw/d7pp9+cxwpK5tFcnXM0lZb2fmUMI5O+jZ4hpx6LW
	 pWbSGx
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Haozhen Li <dezige131@foxmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Dawid Wrobel <me@dawidwrobel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haozhen Li <dezige131@foxmail.com>
Subject: Re: [RFC PATCH 2/2] firmware: qcom: scm: Handle QSEECOM listener callbacks
Date: Mon,  2 Nov 2026 16:27:20 +0000
X-OQ-MSGID: <20261102162720.104489-1-dezige131@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <361131a8-4d30-4e8f-92a3-697dd93e7e30@oss.qualcomm.com>
References: <361131a8-4d30-4e8f-92a3-697dd93e7e30@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Konrad,

Thanks for the review.

Following Dawid's response on the cover-letter thread, I am withdrawing
this RFC. Dawid maintains a tee: qseecom driver that consumes exactly
these interfaces (github.com/wrobelda/linux, branch qcom-qseecom-tee),
with a Goodix SPI fingerprint sensor driver on top, and intends to file
a proper RFC for the complete stack himself. That is exactly the
in-tree consumer you asked for, and a much cleaner architectural path
than my standalone SCM helpers.

The fixes and hardened checks discussed here will be offered as a PR
against Dawid's tree to support his upstream submission instead.

Best regards,
Haozhen Li

