Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698820;
	b=StOh/tR1DikfJsbfwPpx6JouS/saCL9dLFvifDUxN2Rgr3XD2dPb2JTCk213lWLhSt9V
	 SQT/o9KxvHJn5K60GbNckMgXGpbDsXWl1PzEOaTrLqwQlmq5q+uPaf+gDdL6Dd/wbYmKO
	 T45MqPDi4qKdZSqmkTls5nf77Fnxeb4pklFJD2iP4imtzz6jsQPTk2OnlS1wFO8jI6Wrx
	 hchnJcGdl+goC8ixr15nrrzKhYtP1sgFRz/I83avjXjSoEdhOlf1e+mL1/C543TELnJq1
	 Lhdmajc5Cq+HdFZiiw16qGM16OtsEF4VPRAa5JgjKo3yVEbAuwUL32n2tMCxNlbcPNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
	b=YmTqBkChoAyPCbVVwB4Y06weH+WOGlvr/g+1avmywJSNAbz0OmNYOZgt40Q7/gCIgOzp
	 4M8vbddsPO6oflZX5jpU+JrCemCKAcw1jusFKESTShE1NMhOSOAuFcJ00X9BU5Uh06lpo
	 Wi5byWpg+VnbUic9xmEc5G+JpSEJmHkbyTGmI13iXCg5blsQSm0l2BZvLdQ6PcrtXU6n0
	 dR0HWz5bVS/55iBnkBzDE/K6QHyIBW2CLNYEU6KozfXy6lQr4Iy1eHFCVEQq1ihzcHj0N
	 62RvveYQJVQdu3MJv7MDyWpK2seVCXXL8cOHF/7k3JDzx4xnJDIkkXwZYShR3tE25/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bcl4/e4p";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFBE606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CFBE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bcl4/e4p
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-675617e81f9so3532173d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698819; cv=none;
        d=google.com; s=arc-20260327;
        b=TV7sMon2Q1AT6VyTz/Zzhv9IVLeieai5pBZo7NaPBkhXZziI8nvtEqCcTGk71zQzDj
         3jMsBSFJoW5OhqasEHdAoM8wmFBitYEeOeVsgw3Rv2veETGT+lzSsns9EMv4K8v/7TR5
         g18bKxGi7p4bm+sLmtiW08gi/WS2p4i8ZzUFVjmgmO+Wj2CjD16fBVCSOokyHuBsw7n1
         Nb1rqh00zu9QLrAoCBaABlAAEaf6DQBCPDV08zivzW/22/lJmSV0lmQkeFiKsbjaifXe
         N+tVWOn5gv5LjFqWNZVKECSI7qvQAHZux4DX3kY2X8swzlnJTKn3frohHZjHNO0PIFR/
         JkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        fh=Cd5lEnIooXlDPdPP09hbUZrBmZqsqsMIDIC/nJxSRlQ=;
        b=sV00qBmLMP4Dgex+pQWCqyxskbbDG2DsGcyFz5sU24f69WY4rtb+tmsJCzNZGlB83A
         QLcx6rftFx4Gn1w09dkG3P2Weugcs6wqw2VKvyd3ttkZ04bcZxKAFrgO+6zvf8fRm2rK
         rv6pQRmX1BVDYaghblZkWPFJhYxMeJQnpC7Rt37Xo01EYlRAwJmtvxdtD8IpyX73vAWQ
         Q+EwtPHpQHFhMejesnxf38nLQcvEKNU+be5aJIqyihorB8ivWA06X9GLJJwqq4xIRDnv
         50oNMM3mKGoQEPN8P4PTiFOWwX2MjTkG4fdYE5aRS5V85w3GoySGVC6eXLi3oLjq7c/s
         cILw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698819; x=1794303619; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        b=Bcl4/e4pfJXk8T9seSrGkQ+IYi6EBAg3ylBUFruPMYAw5c9nFuNnEbEGQlFGJI1JqH
         4avjO4kIySvU6oj/20gAYXq4+NNeI1wJaaFypgan/bd25u8r90C//Aiww77pBDmbjqDy
         n0k58ogdSg4POJYyNsKbUuAJtT5riXJMTkbflJ52gXwv/FfV5XXyuIejDTRVpsof4QnQ
         WLzD+IS4ax4yk27LJ4/swgyk3GOHNDslT6a7g7ZEUmNPt8SssRYP+Q0GaX37f6cMhxjc
         gHxNWh1/0AGdfZAefBbw+gCF612G5uyJ69FtxRirb1NICz9AbqIz1+bfn3PLHukeTxcU
         Dd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698819; x=1794303619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        b=KYQaTQqkw/S6zGxp+Srluv++TYVRn4AvGYrYfcsOvjhT2lbHH0FlsZvge70/WZznJ5
         H42O/yFE7uQx3uE+1u9Yd4Ru3chBdIEZOY72e+8ZRIBmaSLSwMdI9hfb8NBA3m3s9HMG
         m+EItlieoOvjO85AWKSOzv+MD5t/Xw/wGpnVt05Q+oImYbRtP58YNdqGWnRDKtWzF2c+
         8Di+Z4Gro+PwnffD0lHPK/mCeQoAGhPQstNe5O63yxmhVC+98GhfnU8ViuJnVcnAWflA
         DxsVPH6Y3UqbiPwRzXFi+ha8IsXJPsF3eHo48ybgM0DbRLUcnCF2KuF1GxAloOQ5nG6f
         6MlA==
X-Forwarded-Encrypted: i=1; AKwUvBy/4zXr1XZAOrwN4wDS8olzhU5LwnTo7MppdFpr3k9NkX0AswjXwp6IW1I8U7qm0qEWMdCX1/Y4qcFjyjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lFoRod/NhYD5G7wyZZiwSn7oBawAi9mmWyqtHsi6djOOkVPzF
	0v0HfmhMGWlpxEYwHtTiOnMze4cMiXTGkGHWE/4S2KVwiMxjsikftZXndnC9e2TJBmo9Tg88RLM
	5iGdC2HrAm+J77L6u7DcC2cGaNPgaYA==
X-Gm-Gg: AYBFou0Jlqa0b1lBhbiTvqHkH5JNOCXjGVaDE0oY95HwXuLd5oIBPc3y+U8VECxjd2v
	L19mRSVrL8IplUMFBLm0fJQE9BS/rXV9nLIbvLRlNSLMpuj413oDf0zIOhLwvl3PXIBBgV3AH/v
	8geta3dMRsVEOSdWs1zLOm5mwUQdf74IDwK6vaB1OggC6xbEt09nb014DS5deCZG7edrZn27qn6
	WdoRAjq67OpPqP1X0d7e4JsUIoAEFt1vdJ5yVvODPJzkg/WzFYZ2LsE/JJMLsaSrb1NKJaYOhP1
	ASnR++lqRl/MSc4rjiTBbgmPW7eaOMMoncW29F3x4llnfYk12FpvlYHCEW1Qbr3ePLCJqQeS4Ng
	I61mpyyYRWcLz2N+IgUkxXJv4b9ba11y8D4VCT4LhJM5MDDQCZQ7Ea5JPxm2N9rJefpPNOTTr6A
	Coii+zblDnEZmA6xY=
X-Received: by 2002:a05:690e:80c:20b0:671:3c9c:e5ad with SMTP id
 956f58d0204a3-67ba4f070c8mr5998587d50.49.1793698819403; Tue, 03 Nov 2026
 01:40:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 03:40:07 -0600
X-Gm-Features: AclHuK-4a97yVJVbkGNNnQIL8viqTEZhruO_MoVfFcSl06giv7eYpRWt0lOZS3E
Message-ID: <CANxy8yTAJ=9AwD=s_oVpvnoQWiip2NDecscAJmccRRZ8bCfzww@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: rajanyadav0307@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For transparency, per Documentation/process/generated-content.rst:this
patch and its changelog were prepared with help from an AI coding
assistant (Claude), which drafted them from my instructions and helped
run the tests. I reviewed every line, checked the values against the
Allwinner BSP and the A133 datasheet, tested it on my board, and take
full responsibility for it. Happy to answer any questions.

Rajan
