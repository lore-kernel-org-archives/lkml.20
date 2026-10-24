Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810952;
	b=WtuFeLoAL3JXW7A6ai1PkuFUpPvqdK7JMSVgDIcpTnji6z9nqUCEzQ8DbG7GM2OpQ/Wa
	 /SOwWUzh0SDxFEirM+zGNb/53QQ1KIAOn/5kDKAT55BipJjRGDm9+ymnXSutEcrNnmclB
	 l3JpTaY5QdC714fOLTvwlsspoifdB75KdrnO1wAH5ll4SfLdW+S/Cri7KZYUt0/LNvaPy
	 vkPWfDTfibYPGKHwi1Gt5CVofTznFthkSrg+YAMEXFsNN05RLkTgRCEA7C8eZvL64qxGC
	 OvkInYfC0+bOWPw1hVzqo2H7VyMC7nWmFdEmWybKg7rgbblQBUyYKxHVK7P6GKDjXXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fKDcIDvOzdwB9vAnzcx1GZSR5/ZdYdoONGgGuOdOQZ0=;
	b=qSLz0CjCI/OWPURQ/nNqMIBwhVmwAdtiuZxeBroR081njYcPHOg67ZgUBriwWofKWlU5
	 TzBE1BrCryhsQLJuRs+t0FPTJTfxY8te4q0rs7JjObHOPYQHs+hVVBhH9EQ3tlgJgWEb3
	 qfkeIqWWhnxqsqk16ecA3o3j81WIWrxpE4ux/KMpAkniqlq2czlQT8qJbkebSTk5puENI
	 Yr4QEbNXpSQm+i8SGfKFZo/dqO1M6w1lzyjl8EUNgdEcQnQ+Z/89+2WyiKM8QWRDzRSxN
	 ZAfIdPJh12hZYJkND33wK1uy+GcAudsYhItckpZwXTEs+4oElNk3oax85t7DUbqEXOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bTWi+var;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8051760A2616
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8051760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bTWi+var
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6d290b10a35so642685eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810951; x=1793415751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKDcIDvOzdwB9vAnzcx1GZSR5/ZdYdoONGgGuOdOQZ0=;
        b=bTWi+varfY9Rygv7fXJIqInHPqmdQK63tOExRFbuFBQ7Ku/iWcxqzChZ8OxOAGAwtz
         BZMsrH/Ru1qgZU6i/oCOJBk8sa1ZnERq3EAR3g+uWUQgPRSxAqIpsuIcqTzvh4xocEBm
         alVkUBb0mL/OnF4B6ReVS3o3OkQ3ENl4Eaq2ZQq4lVl+fv+TUG4Ql2l8qxVYVSz6x2w0
         9CWi8gWd3QHCwAvzLERwIIVdLqlAeG2mqD9+43SO+eY5KyGkMxf2+R1lAJKzQ8y1kMZH
         9kY1r85oyzHhxK2Z7uzVZe5UahUjgBbQsuz+QhdKJnjGrWYvQs+XE9VJQDOO8/ZhrQC7
         09Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810951; x=1793415751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKDcIDvOzdwB9vAnzcx1GZSR5/ZdYdoONGgGuOdOQZ0=;
        b=WPqGeTBahCAxmnzltD662VcO+s3QnsjAr3J4qtz7zbByC+l661Ooq2VtrehhAHal7+
         R+tRXMMp3wBPmHgY+MEU7nNsSUwQwxzhD38EsGXG8aOmPxyKJRWTueIALEmUZeL609wn
         Lcq6uA2DkYOzTlvVsP8swDArArxTQG1hEfoWkbtkZRvo2OTeFXgua+qrWahP9FWRYmhZ
         YdAspRzPMYDCtJcR6pvFca9soAeEuqGVQ56dfzjHhGa69Pm+4RUNE+Q0B8LKT7ALdo3x
         6YGma9T791jmYqvCAL1H6HJhi0vJpg7+2KhY0j3s386UDY+tyOyIsRjb/IkMaI4/Vu6m
         rrGA==
X-Forwarded-Encrypted: i=1; AKwUvBzj+JqFSBWxotKBglqeTSSaFVMgoeA+yzqscpwy3lY+3NU//DybynYbhlhRCt/Xcg1AhUcuO+j8wmcB1uA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcjbyj0n9QTeFmLn8bL7jlQiUK4aAng/p9yNVKzIgIHUTIehZA
	dfsVSizroTK22Athw3mh8FDcBkzDlg5jX5BGXpBI0enz+1334fyyUZMF
X-Gm-Gg: AYBFou0cqc+NBe97YTxB0pmT2+ZFX2AmM+Jlp16iNUaWwC8r1CYQxU1qND2bEYnBfjf
	h9I5GOnPOUiFRJyvqDW1/qkm3WvDCtURbsyOv7iFuxponIFS6Mi1+YvHdZriUNnUmNYsJjZtQl/
	pMIMU3EVwmLt3RoGYYEPrYVDRlBMvkRrplOvpsXuvIluW6rY/mmKF4sWJ/TF5V43PwdfR+yJmeX
	wVqbZFMMy0CLEc0Epp22AjLAB45SSCBLp+jalXKe2XEWaHEm7w7yIWJ++GoK2u9PJiN4vmHYEfe
	NmT+qEUey/vRumxbUz3HFooUrXJ4ncR4KzEkpXb+SPCvRS0O6+WMbhS3Qb0jB3oiRM/xEj007i6
	TW6Tc1KhQupo9RtCX1iZI+PtIVuWUczPo4LZUoJR3bga25N6CdOFneWIYgGmwx/7CO857BdfiBz
	QBm99fQP5NBv39TblLwZPUR0Ia7rVY65ylWal4i3A+IZgt+hxhO2NZeaN6pHk5Ph4rvR6iNT1kE
	ybiJPsaHxHcqKpzv8W5/103ZifoFEaYAPEjIgc/kaKflplo49+0DcDIM9LyvWKiONb1gpAKkp5e
	hfFXdwFjESZ6Y7XpPgJS2HbRGQ==
X-Received: by 2002:a05:6820:c0c6:10b0:6c0:7620:fccf with SMTP id 006d021491bc7-70ba0ec9f71mr274394eaf.57.1792810951596;
        Fri, 23 Oct 2026 20:02:31 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:31 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/11] phy: qualcomm: qmp-combo: Remove VCO_DIV programming from qmp_v8_configure_dp_clocks()
Date: Fri, 23 Oct 2026 22:01:33 -0500
Message-ID: <20261024030142.13643-10-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:25 +0530, Nabige Aala wrote:
> QPHY_DP_PHY_VCO_DIV register does not participate in the
> divider of vco_divided_clk, it can be left as it is- No impact
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
