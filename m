Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910F3BBFBD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077589; cv=none; b=Bp2uQ/ByAoomgp/xF4Qj7KJt4dOd2wji6kwY0AqNONxNlRTZ/avgtaRGZTfbB0FgTz71vZIrBqRMa08sDhKoQg4KmFZSkiNyXL6MSbPO+g4zVi5+L5K4ppmrz968LjM4YmdakQ4/FkwyP0uTf1aVBg3ltDXT97JaLy8Omf834FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077589; c=relaxed/simple;
	bh=bEuFPOQiVyy1KX5sOgO4QdQ2fID4pTQ6O0IMMPI0HDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJoypO5aDgU1l+jVJRAWV39AoapJDa++Nza1v7Lr30GPv73G7k4ltZ0DSLhpE0unT66XEStIe9oGGq4/ddO0lH9UiOedXI/ECRuHPUB4pdMVQQLwvdWswjfe4jQxOv5LTyjd8StToYRmWDQhbjHWV8ufMiIL+2EJU+ZcmFUsXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rquY1iOl; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rquY1iOl"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15756f82e8aso44090c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077586; x=1792682386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEuFPOQiVyy1KX5sOgO4QdQ2fID4pTQ6O0IMMPI0HDk=;
        b=rquY1iOlwAtqyt/71W9yojpIgIBne71gySEqaHTRUimkXaf/Yde7BbqHeZNC8h4PiA
         ji7ybfqqwetEyUE7m/QFUbqsunehF3EgKpR6RASegiBV6ahnqOzVw9mllICLGCTYxzyf
         Qlfph33H6XF5cAasuxizHXdoRjbdAfJJxYHvtRxF//JlgA6WoRV0UtnFg3y7riEHIBtm
         uRD0leUkd4HFYSjaVBTewpmiMavApqu3K7CgXintKDuaNQz+ZJYdX/Yff5P1Oahxyqh4
         npuwR+2vVoPq3iHouM6l3TqA89/VEQd6IGcb9eNK1xATBKOu8uWnneklipOCMiTvJ/BW
         RcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077586; x=1792682386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEuFPOQiVyy1KX5sOgO4QdQ2fID4pTQ6O0IMMPI0HDk=;
        b=vtv5Z219iAsZuWpY2ZN9bsXsipGo/QrVIhL2eajszXj4h41rnQbgRx5zdg5Nz4E7xn
         m7ijjaVK75+BAOG4Qhf7DaRm2eHVl9uLnzJOchMZGW8yuooVsJH2lYLhcM/ZwWKm5p/u
         EtKIS+UAhXYQ0GWEkp1KihcDugsLgAYEynNIMTWfRAoFGyyePESPZ67JPEOrEVmMsNOG
         l5Est4yCAorSuzhd8QUwEEnefal85KH4qrpVT4wir+dDrj5kJ9n9gfHZRnbF7ziBt/K6
         KQl3tbEtv+zu0h1ej9zaSGxFiZypSU4YusxNC5fBIPTWeMgstrQi1/ZdjLltbD62TXYz
         vQHg==
X-Forwarded-Encrypted: i=1; AKwUvBxDjhLhR2eCOc4VgLiT3COx0U62YbNMdmK/PegVqxHjke9X+k2k2ATAjPamgq1sAPLbQtOANwJpn9x36uM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+wcPrVKaALP/4U+Ri8sIW3lNqYDbNqWWlL1uEvrl/AB/EhlyR
	xnnmnONanCaDt0DYndAUrptXL2+ynntsudndklEAAEPiZohrlNg1KjiV
X-Gm-Gg: AYBFou3uFdPcsmffwgwKVElKEhEnYo+wIY5jGx8Tan6qOGDTN96kUba2FNdxrnl9yrP
	ET5PO+W4ERbNmbZqrISAtRwPLO3R/Of8aqhBYgapQkjNsGtiuTkz236SKUeacg89KP4X4ZFpRuF
	eLl5RwlSPsI3Yy4mXVWMNYT5aX8o8LOJuanpsmLfS74LFovcLCUGibRUmADgd9vf0+0zq3nhzUC
	NK8HOIYBwvRXW4Y/pFXJfuN37dcE7tWbl2W58FJqaGGEi2PjT7JOoPP53X3JIzEAlL4FGRt6Vee
	bh4hmUM61tw/Cg6Ln5rL+/E7EJMxMVQCSHuQkVRDxaU8r//9NI2GRSCbtQ4miqzDS+hLrYPji0i
	8q/g7TvmNURq4/v3HhYNZIZm8xv+igNPSIVW2uUYJ26eY58m7tFfvzbkdA6ES+0Y3q55FufqHRr
	ETx3V+JA+jQ/sDM0C47go+fSAsm6aE0ziibJf5zH9vuCjPJ866X1vHlD29FQ8nq4syfXRhVAkg5
	PM=
X-Received: by 2002:a05:701b:208a:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1825339eb73mr289092c88.19.1792077586315;
        Thu, 15 Oct 2026 08:19:46 -0700 (PDT)
Received: from JMD ([117.213.200.3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a3f6186fsm58994476c88.14.2026.10.15.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:19:45 -0700 (PDT)
From: Atul Akella <atul.akella@gmail.com>
To: mathieu.poirier@linaro.org,
	bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: mtk_scp: fix da_to_va() bounds checks
Date: Thu, 15 Oct 2026 20:49:38 +0530
Message-ID: <20261015151938.1331-1-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <cover.1791198233.git.atul.akella@gmail.com>
References: <cover.1791198233.git.atul.akella@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Just following up on this series. Both patches are compile-tested only (arm64 defconfig, W=1).
I haven't tested them on actual mt8183/mt8192 hardware, but I'd be happy to help with hardware testing if someone has access to a suitable board. I'm also open to addressing any review feedback.

Thanks,
Atul
