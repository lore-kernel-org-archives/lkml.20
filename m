Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636865;
	b=rysd2ZNYinCIagaCcbDZGonXHnfPApuNSlb78cxf9OshwhZBO1pqb1pn5mdmUYYqSkC4
	 2+8zn3HYkIBfrq12Z82tqCJX7lL/ziDr43PrbyWwN4/p8kOZqNL5DDqVXcHt3kXAJoMbj
	 9TuWUiK3ZV0cVCbCltU+Sq3CBxN/FoTLq/PSFnSdvRlNlfPrHjZMM39bqVncWC1rahsde
	 iMatBo0Q8G86WLH5e9olGwko50ICF4k1NQ3BO/E1ss5270AxPiRbw3XK78VdT7arODvsH
	 YpLXusprVveo9S6Xg22rUd5001Q/LE2Enr04BZMCnxR8oFpst0rjbKEOKsjaB9N/iJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636865;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ff3BZrkChdI7027N7uoy8k2ci2kqph0m3jBPVQrD6Go=;
	b=M90hACaiqMK6rRMIV8l27InnfXfWoEPgLJbZiC2G3AWZJQJxj/r7E3o3RHaK3nVDkBL7
	 FQUcmucTcj5hUHrlc+fgAPhAoZA6jDdAqSAxCjdl4WxJ1v/jFG8oEXeN86C9k8MkmceAc
	 9VciBidntMOiNi2MAghN0+7g6fSi0rM+lGPcZiy7aQ+1nD23BddG63SXpwnnQO5n8Xc+q
	 nIFPYQqUZahbD1GD43HKOaDHWnQfwtlXM691jQbT6M/kYQ2zvgHW7fHS/vgA5gcVZSt7c
	 C9WXTFYV0jSZT2E9JTfpO+O0dpesvt9yuYK4jkv/aV85InWTH3wSLeyO5yQqr1eqzRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=sd8siFk1;
	arc=none smtp.remote-ip=203.205.221.233
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B68609D82E;
	Mon,  2 Nov 2026 16:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B68609D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=sd8siFk1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793636855;
	bh=ff3BZrkChdI7027N7uoy8k2ci2kqph0m3jBPVQrD6Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sd8siFk1Ozll/WcUcjlECBTRbfuyIhucPbGiCmZ5Gj9v2qZZBq/Zf2cZJsdZBr4yF
	 iBA35V1ZQOkC8mTZX8qYF4hoaiRnDxV/fJLnWNodvQ+oSthQ9firUOl8/oJ7euzffJ
	 hErNbqWCPhCVEwGrAwO94TMYF9qs8yqpvYkdYdf4=
Received: from ubuntu.lan ([223.160.115.26])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 6DF1BC5E; Tue, 03 Nov 2026 00:27:31 +0800
X-QQ-mid: xmsmtpt1793636851t034awwff
Message-ID: <tencent_1A709D2F1A0F149D99E48871997B9FB32607@qq.com>
X-QQ-XMAILINFO: MC1fDArw1Zbws/K7XTar14mJT1rKIFRTt7uWt1eJHngEhGESrjoaZtZksUg8ps
	 88iH8Zay6LAm1XypPlgXoW7bIGsVxIO+2AraxcLHDLYKLzdOHRsSbIitlK6mynAl6m5v20cKS+fw
	 MvhsPJ7/35Tlo6vEFLRgJ2Xn9eTZ+rVzwBpbnv5kkfBLyB4xEv4OM8bVkoGrhpoG7/JiKABs8Ly1
	 X6rE2Iu2eOFEko4uYEOOC2jaMCOFJnEZ2Fr4FK7hYqDqYsR77lvcewIzSIqjG/hoFoJB8aUi9WqE
	 LT4beVZpeEr00FL4bUuLR4RFiuF5Ca1ZcUHMgL/KCewkJughm42R711TF08z1+F2/bRlq6YO/XhA
	 NGYXsdJxQDUmg3DTSujOi3ZtAUpHBcl4BxMAzd2wOKOVgccta/EWty1ybSHcpzIv2A87xjQrZfDa
	 iGKSs9pO1Us0Bzx08HMNNqX1zfcsx+y/B+mWAALkrZS0PwmxBY9NwCttGHvhIjoeREO01u8W9XIc
	 iKF7gvxriY1ZIlZGn7qX/wrGzlH99ypTwer0Vg3qyLadPt3tCl4APxaxpw6fwxq+c3iFx4vcexoS
	 tpKEvtJMjFE2p3kM5HPmrslNAJDvIfNDLEXk7eqaDUFf0YJt9p4qhsF6LYH0yc83RpUdfjlPNAjf
	 EUdIoSoeArdJ2eMGAXKwJ05lKK/cKfVMe4xznfkqQz454qvwcPYVULOLcbxUqIQ5f3UOCyEHsyXd
	 +IxFLKSiVbX1nYm8ggBuDamHayQKi7kYEspSAl/k7jHVMAN2jMTlDZPiHonWKVQWBtFuQPCLRmk8
	 Lj5yeOOLWXanvbSyibEJJCc9WzOO9k69HmCWRHXhpM6SuBN7jfA0Lf/cOZPOUbhb/AMmd6H5j5gT
	 NB1z77XOnWk4dwDUx/9QXVOwEdBeSBFTvyJYyfKt8iQGdEygCUI5Lb+ZMhohapjkwqWjGqSjN9Iw
	 DpAdd6DEAOrnZlEPQCgfxSGv1mD7CHxGlD3pMHehPOH/yMPnNAdpK6lJAh+MbEcjX4j+IIOzNwg/
	 gQb/ofJpLTuLirim0e9aMqqCYR0o6vUcHwY0L+G9umfsmjZUJPDC+ry1JI/sEZ7MPECAzf2wS23A
	 h2hDcibyZg1r/xEkjMjahWZfHvzLcBTwl8uFkM
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Haozhen Li <dezige131@foxmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Dawid Wrobel <me@dawidwrobel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Haozhen Li <dezige131@foxmail.com>
Subject: Re: [RFC PATCH 1/2] firmware: qcom: scm: Add QSEECOM app loading and shutdown
Date: Mon,  2 Nov 2026 16:27:28 +0000
X-OQ-MSGID: <20261102162728.104501-1-dezige131@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <60afa31c-0c68-4e77-81b7-ef78f987f429@oss.qualcomm.com>
References: <60afa31c-0c68-4e77-81b7-ef78f987f429@oss.qualcomm.com>
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

Thanks for pointing these out.

You were completely right about the 4 GiB claim. I probed it on
sc8280xp by OR-ing bit 32 into an otherwise valid image address handed
to APP_START: a firmware reading only the low 32 bits would have
loaded from the untouched address and succeeded, but the call came
back with an explicit error (result 0xffffffffffffffd1, mapped by the
kernel to -EINVAL) instead. There is no silent truncation on this
firmware, and the universal claim in v1 was simply wrong.

Since I am withdrawing this series in favor of Dawid's upcoming RFC
(see the cover-letter thread), all of your feedback -- the
reverse-Christmas-tree sorting, the overflow-safe comparison form you
suggested (img_len > SZ_4G - img_phys), and reframing the 4 GiB check
as defensive hardening -- will go into a PR against his tree instead
of a v2 from me.

Best regards,
Haozhen Li

