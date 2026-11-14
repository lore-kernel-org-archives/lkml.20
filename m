Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678349;
	b=Wkn5KaW666JvM1EcWKAcPkMEjr1a3tDX0SGI08+hdnS8az1gmwDBiClwslsG8Egv/zQE
	 Q1TOG/WKx+Hfc16+fO4D+OF3pms282ZoKPlppkWd/vb3r0g/HsyGDCDyutghYoAJJcBUj
	 QlsMFax3Y95c9vGYtL0yK3KVLCHNs7DMMi7/DfCZTKBt/0SCn/4CrPKRO3b9GsE2MuCiW
	 CKz/jSNxRiOKL0gXseE0MUGR6Fshqp8scKtebOAd+rHMSZAWCHTAtxIuuDgWVQNaw4RV5
	 /Xzsp9qaVJGes0FeUiXNbeej0vURC/w809R121v07er3xMaTbkyNp9jPMSZ0w0wV6MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cEiz3TWwHF+fIuW7i8DsJuBkmIDZsePDbm8l7cMfQMo=;
	b=fZursPtD+CIldm4ygLFqM6/wo6dAAItG3Ipke6EhG53obO3TyFRrLfVhpaGcC9LHhwgs
	 Cj5ly3tvVreYwZ3h8PzZe1/xDJxAlKTT+ag7AXUmCaR9WIYB+d8+HfIZBPUsPikF9xipf
	 doEkyHjbKMlQqwVEu4fPXwp3sIIXvEWbYx8y2Fv/1J3DiKHpOvMAaXaeuJnSZ6oQOaUFe
	 WbM+wp1ygEKtjSraDg35QJzH9aUfsW2ApEyhWokKM3J7x1ljQXOuIUDUHJhhvRLZRRBx/
	 AX41OJIrhc/Coz1S4eIHuvzqEY75SSVscP2rvM4q10NSNV/qFnrOiCGn82L249G4rLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=uMXE4lJf;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53D606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B53D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=uMXE4lJf
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so153782066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794678347; x=1795283147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEiz3TWwHF+fIuW7i8DsJuBkmIDZsePDbm8l7cMfQMo=;
        b=uMXE4lJfTArG0gCj3Di5yz0u2DCklqsdtTPCADzHhx3fg/rnHItX11qsTMgMT1bH9L
         fIRgaXEr9kJ8Uw6TINxpdMFjWUyc0RuxWCjVW96eU66ZK7Mx68BpTfG+lTl/Z+5N3Mtb
         9FOE2ZoWR7yxaJSiOp/ZAV87HOPIpqx5Cw9eBfHYzmDrOBhdgRCb1FoZe6Pg6UNznTLm
         utnO/fY9CSPFwE1gqmgsMj/O2LIrumJ9EWZ1ip9xWxXtYr1bEmGXA0c1hZ4p9kbqsGt7
         Ajq6FDxj16/soWPIdEnuXzq6f7P3RAqxas7E46F0Agrcs4xukyxhj0Ui00FEEo0e8nX8
         /Gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678347; x=1795283147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEiz3TWwHF+fIuW7i8DsJuBkmIDZsePDbm8l7cMfQMo=;
        b=zywZrCqkABTXWAkpmql/1qcDSzmW44Sf3H92RGzss+UgxGwkINqaDmOi4+0TKOAKTh
         MrEu3VOHrrCb0Bf7PY1QxZ7mz+jZj1a0ZTV42i6JVQC0GR8hyvgE3k9GYu5SmoHBCiTx
         gM8AuPBiaDVIKTcuVRm0G3WsrhnAttsh8CEpDq3T1ak1M8KSi8/E/eTlpgkzoYTdngBI
         xnNuobFaqTpJ5PlC2viyou6dxdrLF6+EwgcmGU4VT2hi1Gtqerztlm3P6KfVQrKSRAQu
         7OTQGDALGDTDkr/91nv0BAP9L4fNwFMx3MGwRU/9YSjokjb1OXM2YnuzYUuYk61pisOe
         X/2Q==
X-Forwarded-Encrypted: i=1; AL+hErHLKalI9V+MsoYxyNYmwQw+DrAPkaIbsqQIkElLmvp57EXLB2M8XlZFkYXW0ENZchw83igtC1cpPTGuQ34=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wjra3vL9626KIq8N79aQYImAffdLAlnXxNJZG9PjLSlB5KFGr
	uspWatRxmnWQ5EKcSoNyWNjgbKDRTDe6owTlNesSDKdzUuphmIVpsOZ5ErjTMqJO0g==
X-Gm-Gg: AYBFou0W5FGRGr4q7OiF2bXWeayYg46EzeZrnyt0VW+ut/8GgRvnPpCM65/zbVQypas
	JO3J/kf9xkQtkpXXm6hWdKOAbWUatf7YKgemncg+KROGE9oM1RCQpEKqOyhmU1cDzlzq2Hsd1sV
	YHn8ygV4qPU9lYPA9eyob2TOU5TpI0A3q47wuJnJ4/o1GqF3VTQ0U5PI4QtTwbzZqVfl10P/tyC
	osijpauO96RngCXNbwTKTah7oDp8rXe4t5ZEMFZgTv88zbzLWs62l9bmfR7IPN/2/XbuJHOsHQI
	NMqMgfy4Jx3U3bZxM4aHIK/RDn2DPLCNJmG4s7fygY4Nn1iAViYG1xIaEr8kLiHlNAJaGV+5iqM
	QPWA0XkQdzDD8hoTcknCU1W7J+qdDb0qP8RObsic9lzgCHJTdJEwEY1ID02EF/Lqdw8Q2lNKiGE
	hdMbix2kHK1Dz6wx4SwjDEg/xXe3uG+uQVG51+ECYRhZNVG05jeahD5xvWpP6udTz+cN9WYYn+E
	Z/5yMdb8Oh6dGotcDkPzFK2ZKR7PsWSyUR2fjr9J2VfMJRXZ9W0Xh7bD17cnkJfgJR+g8KLqDqw
	3BwZWWrW4BiHQhj8woWOVjGJybpbKQ2tKwrHvQp76yc+ZmSTYFZ9/SykWmoppHWDK8bBLCJE2ad
	nTjRCgCtZZ8Le9BMoGwJ86CQOIgcaukb1rDf8YuIYXZLrEHy5FUDxNg+SVCVXmAFOlCOXwiNWdk
	hK6Y9afrWREn4IHaEHKSO+0qn5NdzijzKI1cRz0Dh+N9QN6LXnybCZ6M0Wlo4WCDrIYUZwzunCA
	mihe0fNVDM0cQ2CZPDOQv4ubRM+SBScDOmyk58d2b+4Cyw1KOc3QU7yWJrr5CpFf5wMODTkjh67
	ieE=
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr488914366b.16.1794678347384;
        Sat, 14 Nov 2026 09:45:47 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm2474985a12.6.2026.11.14.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:45:46 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Keep objects of queued VM_BIND unmaps busy
Date: Sat, 14 Nov 2026 18:45:44 +0100
Message-ID: <20261114174544.769803-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CACSVV01-U9jEOfKsO8fgGtG_xQqjOF4TAKycJnqp4E-eDqsC2g@mail.gmail.com>
References: <20261111080619.244138-1-julius@bairaktaris.de> <CACSVV01-U9jEOfKsO8fgGtG_xQqjOF4TAKycJnqp4E-eDqsC2g@mail.gmail.com>
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

On Fri, Nov 13, 2026 at 12:57:27PM -0800, Rob Clark wrote:
> Nice catch.. I don't really love that it means we can evict mapped
> buffers but not ones pending unmap.  But so far I don't really see any
> better option.

Agreed, I didn't find a better one either.

> (Small note, a dma_fence should fire in a finite amount of time, or
> TDR should kick in on the signaling side.  That ofc doesn't change the
> issue here.)

Right, thanks.

Julius
