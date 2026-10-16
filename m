Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52843BB665
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140056; cv=none; b=sW4jOZ+1jDAOlDXMTsrWIvWvwpzhP5Ts7nURQl6S2Vt7JNy1+vYHPS/ck+RGPBEddtacDsz0RsBGK+HvuDSd/AnucVZuY6guWb0KJSu3b2E+SU99yulDWf61//v397+psdOWZ+7X7GKAa/YlcHxHVpCfojRsBm/Bh5/WV16IOD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140056; c=relaxed/simple;
	bh=zCNrwnurgO+KAhjv03oxH9hTcLmUU1xStBcQnjNB2S0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hyys4cYzK07tIw6Io45BUwj0RYYet9SixI8pIXtYB++vdBbIr3J+mCQ70E3PMEmCxJr3YZEhDsOSxEGt/jHHWkjKsv7mnWCAF3jvPdVCl5WGMyXuZ9zj+133nKMPc8z45B6OgwwNDMw5+Y/AkbxTF3theNHDeCg4Pknw8oG6DhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abvCceWR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abvCceWR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28295815e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140053; x=1792744853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GyvDCXoOZxhaF1YO2iBjYziahy1VyrzPfIWpLTL1Is=;
        b=abvCceWRVbCXjX284RigbGgHiOY5/pYEP0UJQNKYJxcEqlWYueVLaMgce92p33XcXV
         AEnNnL3tn7ffGUFtd41pbk33O34mk1ZnbV55jSX0E0mP4pFxMaoXw8vMElaVXzpOHs6m
         dBTziSTm2lYbF26WQ8NlnZ92adP81J5yRsj3VWGiOLOOn0HrSUzvqziLVWVaRtPFvC/3
         KITnvggwyZEec00rTzUqRRNOGHQkCUlSclsHbMiPqMaNW+w4aAEzxWPKo6hUsoz2ymzH
         LUWSm8A3nuMFZVzH9t1ZIoWAwLV430I0AbLG0wr7hgza80YwPfU2mNMaz4Pjovz/3hN4
         rkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140053; x=1792744853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GyvDCXoOZxhaF1YO2iBjYziahy1VyrzPfIWpLTL1Is=;
        b=In6/D7dk06R1liQ0tk41lkQ8uSoROKL8Z8+rkA3ASjydchn9JHO4PxUUNyAz4HwMI+
         lxjiK00Urxc/z2f4D4mUoXwwYHXHcpMtTsTQDxMWVMDZFJN+kFdI3he7ycVd3oEQyjE5
         NoBLfptP0aQ4McrI0oocX/zAuXIbf392BOI/0v0eY8zh2s9WVzwuuISwPr1BauANZdxI
         XN9b6wmW/DboN/4G3Cb7HFLomjIrzKFf43R5jjbYoIwu3jtekRPrfhZI3S07p34P7611
         BH38RTPoEqxSoO6AaOsHZAMC2C+2Lt3r+thbUfZfB1o8fSa01zLtZBbagWupD1THaFvF
         QmlA==
X-Forwarded-Encrypted: i=1; AKwUvBweHXG7dJLH3bJunT17QH5t6yv7CaLU9TO7YpYBbUbjqBvtRZyYNzZRo55z0ksuXVx6lT+N5Fps3EbX7gA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+sYwg3+G5+VjM2TbW33HTI3w1NGcRGXw67Zsag+4EOKowvZMt
	kSau76Apdu+fqLSnCroQ6/H16epCtDpOOZoPSlz+b+ASo36Ll8a8xLy/
X-Gm-Gg: AYBFou3FqHMlM0LFW5BvH3JGCjYZebuY2Jqyl4pR0S+IkuB25p96Aqpn30zfk8xymQ6
	8G0nW18cfh73T5kwHnKHsWELQeyPtfMXkm+4NaEA/a70on0gVE47UmmIQBSi7I93IfosnX+kgHs
	w/ra/JuGBSGIvZkc5tafeyhnajLhnvHOhUhpIdsL7iw9YWPtsZj8kziHXiZeSOw3HG2N/QDN/WR
	7fPL6RcXb+G0hEdwl/Rt2Mov75//F1bxC+Y04hQRWg/uKF52qf5DYNhxT/5m2WqYtHiu/YhMA/q
	jMlRzcpSPsSnhCSbxpnBJ049VXa9Ho2i47S+vC95dNNiVKRTdmDcNwpeRkBt4fY2LPLcOoJfO22
	L1++mfzI8wIvub3XPQ2g1F8kd/OON/hARyxrlHCaMfZEZp8DkL16K4DSCEql2GA/dEpZwh6xH3R
	IsM8gQTYgPcWePhpH+TAlzdCvDQJzF1HWHHys6Sydjs1ow+H+XvS6zeTR27q+epMV0j0DsGJ84U
	wiK4YlX31jxIlET5FICyh1G1DuD6x6MCwzvj+3mlTYbm9S7Ni3J0d0Kk9J1FC4HX4OIPySuwVG6
	GDVwMPoCw33xNfyzPUC+m+O8+2Ml+v/T
X-Received: by 2002:a05:600c:3e8f:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a18e4a3fbdmr441778475e9.16.1792140052601;
        Fri, 16 Oct 2026 01:40:52 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: imx8mm: Enable DMIC input on Variscite boards
Date: Fri, 16 Oct 2026 10:40:09 +0200
Message-ID: <cover.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series describes the digital microphone connection to the WM8904
codec on the Variscite DART-MX8M-MINI and VAR-SOM-MX8M-MINI platforms.

Configure IN1L as DMICDAT1 on both platforms to enable the digital
microphone capture path.

Stefano Radaelli (2):
  arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
  arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  | 2 ++
 2 files changed, 4 insertions(+)


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3

