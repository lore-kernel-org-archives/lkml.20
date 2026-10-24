Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810949;
	b=id/HNEuvkLKuMNuTCoSDcvfVbmQTApc9wXDH0vQ4r7Kcoxmeutb1XXkYvijELDSneQEA
	 r/YQpAt/HTmAqWkiexEFZ2JoikzVyIFB3q9zT+WS6lljaC+7WvrgzOOxXUE+fPB1XLZCu
	 zLqsEsUpO3viZah3d9hgV39f0fLezaUJxkGQ/Q5YNtgmDkmDxhdxCTO2FVU1UJ8u+KbDK
	 866ODWXC2I3LpM3CXcalVff9c7ViAZTTV5yk84QOQxTtbL5kzElk2n+aRf4p6vtHS9QkL
	 ICNjrX6OY0RCj27PrIuvmtCgkFPGVP05neLUkzie+fRwNYa8X5YLNnW7rEgJ6Rs6mPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fAkzqZbGN3Mvn3Rb0iYOn/dd4HhG4tyMlp6PIvyFcpA=;
	b=h+pOLQqVWY9Zy0+5EoT12gm7nCJfapOES1OYoyoI43tencuG1Nyso3a4N0b6YLeDO8jb
	 zYcFxpxZ0EVdTnBolj/NJsvxY2tNROVhmTLcZ+ryVY9NEbBtsyvrlGXKEORV2Qdzv+08s
	 TkTK5t65CowujoAxoNC+lOa9hTXcqZwi3aWEknsFiGnXs9Dke6LJBuxoDr33kL0neNpIi
	 XKl1fv8NbOAaSNDya5SOiDuABqkQ+YPX9G/nd1R//n9XZAQtl48748XZvSPBq0A+Qouqj
	 ZNsUMEvlHuAjiFR9Cesf0SyRw9FpkMORHTE+1fKxJ5pjkikumVMK6C4XGDp3mYo+Bsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9WwTF74;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9760A3801
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B9760A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9WwTF74
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-70094949641so1292651eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810947; x=1793415747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAkzqZbGN3Mvn3Rb0iYOn/dd4HhG4tyMlp6PIvyFcpA=;
        b=J9WwTF74MXV9RawHKLq9pGOKhC8CQansEN6WF9F/UnVApAErB6LSr8qUewcHRsvk4C
         V3U2iCe420Mssa2W8mB8Mmq4BS0JLXM2smcvdwXgpLyqEvsV6IeC6dp3qVrjjAyqw84z
         G6N2/u2D/WuClR+oThFwze+V0fhOErE8rYq0uNxuzrr6mdWhQbCdYoEeFETbmx5agFAr
         vlzMBO3fqTQdLgR6QxxylK6WwmHUyQIRsjADXdbgEbmUPu180+BXB3/Dtr30jjUClPhn
         nHxT0vQ+zeVSwHRrPO+4O4AuuILGlkOheoCUh9UOxSfwxTV5IEEX2eBKMhIEhlabQzk7
         7hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810947; x=1793415747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAkzqZbGN3Mvn3Rb0iYOn/dd4HhG4tyMlp6PIvyFcpA=;
        b=CiBrlyg5vSMw+w1AOXvdvoQgUMlaNiVa3YdmrKESAwoyMYAmilUfpMBx1TGwyNR17J
         hut76klKLggGQDS7yd/hzrb/kHnpFv1DY55qTMFphdLxqZx9zt/y72PUEht/80kwoxl4
         HGAZStatPfMMCfMKDnSOQ4EJxPX8viVpzdp/1zh/0zc9zNtdKLe9KJmwRvJxE0cLHxi+
         N8hdla5hUxMpWwizJX1TYOWY3BeVXTpYJjik8bEVnEneVxzaZ1ahV4598Y0xYWHujQYv
         JwBIDLGvH7mDPuc9ey7Twc5P6CkNqE404A1WCqzbJu0AZn5CAm3ZjcNEYDqQ0cK455JS
         tTSg==
X-Forwarded-Encrypted: i=1; AKwUvBx4jDzOBrOPHMXDEB2+Cx8uau+257FNOEx0D+EoVef7FVHTPeMxO4kaTWKxyKwvAUE8UMgL5A80dPLgmzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcxLqeyaULRYcqXy1vIhxr/4kSKwCT6gJZ69KLEite+D/jUh0G
	nChThlk+oP54ZtPqdYBAR9ac2iFxX2X6BOXshv/eNe8r4+S3TrBDFLc4
X-Gm-Gg: AYBFou0uJobIeMslAnpO1VRUlkmecqAO4LVzfbp59khMUZv7L8UmqPxmABdAyriY8UH
	hoSZtH3wWBXKm5/qjK7mn6ktEqQ810g8/DcIus+SkYh2+0u5VhJbNa9FfGyfB/Na3jBbODNT41N
	k0PGsNoVqlxqBsm8ihCGE02LT66xm4otqT5DceSnijdrRU2HXY4V4Myv+3RayPq2zMbFyvV1K/L
	H/uzMXow2jNlqWeHEOpreQIjrsFSH5CTlrKHW41kIi4T6CZo50IWbPKwj3/bUIVX3GU+Hzv7nNm
	wQrr79ufX/sjvU6BIsF/QO0qmty3xTqWUX9EhdFGyfkrqtOPl1ujINBGWpAE0OM1KmY3bJzJ3tg
	f/PF47yW9hGU8NYVNs4ffsj7sSnL6HsLTB4vWP+o6owBBCrZHt1tXs3IBEhlGIBjdVunx5RqN6Q
	/4OjCChD0ON+OCWlZFQAPU5ZxSIJfgZY8HMlYqVUa8DYZHa0t0CEHoganKaP81hSF0AKWKmqT06
	egL6qNQJ+/PyAzBE+aM3iTepC+JFQ2lANEcTksdVEdmJiMaak4edTmijIM89mg+m4sz6vsBZyXF
	LSClbyxUj/2xv89oYV7uQG+X8A==
X-Received: by 2002:a05:6820:60c:b0:706:5b0b:4e74 with SMTP id 006d021491bc7-70ba11762d3mr238542eaf.5.1792810947509;
        Fri, 23 Oct 2026 20:02:27 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:27 -0700 (PDT)
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
Subject: Re: [PATCH v5 05/11] phy: qualcomm: qmp-combo: Add hardware-specific dp_aux_cfg2 and dp_phy_cfg1 fields
Date: Fri, 23 Oct 2026 22:01:30 -0500
Message-ID: <20261024030142.13643-7-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:22 +0530, Nabige Aala wrote:
> Add dp_aux_cfg2 and dp_phy_cfg1 fields to qmp_phy_cfg to allow
> hardware-specific DP PHY register values to be specified per-platform
> rather than hardcoded in the configure functions.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
