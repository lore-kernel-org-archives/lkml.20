Received: from mail-qk2-f11.google.com (mail-qk2-f11.google.com [74.125.230.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68AD3822B4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791676533; cv=none; b=cnNuWJO0efzSl2WX2dfCeMbWeTRlfoQkaC2jwrKzudP7REhazQS/TCVIAkszkaR14hv/9pco6BDC4Tq1d2FluBjJH8oaPpizMTbsZJbKxyKzEIMC2jprR1iL//n0mDbT+5cRqDCLNRwAavIC6eRoxJ6lcmM7sz7Ud02PBs3UEB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791676533; c=relaxed/simple;
	bh=lUHNvRVVJKsGAF3s179NCWP69O/w7AOonPfBpTHjQoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pro/UJS/giTfuYHRC8cakA68VHuCYVldlSfBbBBfXjTjdbLMHru6sTeGwAhiR1FKvZOIw2We99o3gD1j128j9Yo0pgnVrCV33oBWWN7j6hbs57nbx5qVjUbD3jobhN9f2yrQ5gRuAoF7LaTFjyavuU+qxQEIhMavEleIOPUmFk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DW9kK6Jk; arc=none smtp.client-ip=74.125.230.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DW9kK6Jk"
Received: by mail-qk2-f11.google.com with SMTP id d75a77b69052e-5350beb1d49so8784791cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791676531; x=1792281331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FybNLzC2qT6eMhACQiNU/7Tni+cNIjGAb7dFyWED4A=;
        b=DW9kK6JkRcb1S1Fa2ZPI37/h5voOXN1Z9hSyPRJkSoi6luWeA/ChLB+TRBvvVE0Hrp
         pxaFVQR7A2F63X7xs0yUyy/pZkWK6F2EcIbSeYmzH81A0OpXje8UQnJBvHQ8iTUYZegj
         rxZuJtjOYuHNlOn9IZDNy9YzmNzilIYNnT8+Nd0VQVKUsMFtU5YndsP0ccAGsv7tcGi1
         cb+kKWxjd9CUIQ0WmvntF6cuf2PXnmAzaQtDyQYsHPtcyv/TNlsZiujANWs5zsD9Gy+P
         5X7WAoaqzVHOih0KNK8Qwlvxtv99hG7dAxDwjgX/o2emFcMMHLCRoyesp+mNNZezMDqr
         VRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791676531; x=1792281331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9FybNLzC2qT6eMhACQiNU/7Tni+cNIjGAb7dFyWED4A=;
        b=UkZo01NlPujqPf8FSlR7nWyXWKt5C+Rgr1MzqcLd5QDsJgnwnVOPBzdfmg8CHW5L4x
         r9FbTXC/yPbfF7iJL1MDWXlNQnwL9mI7iasPEPMN7DsaDxc/Hk/0GeQ7dmy2WqlhRU85
         J+sXPLNrty1Vq5wyZDLY2Rl9IT4s7qjQS+PJD6oi8dba2YS7M7J7jx8RIX25gClAGLPB
         s9aM1E65QQdatUPY/wq5BG/kxZOY1VjMkB693lA9FqfBeQm/KB+iLfkd4/vidMViCl72
         IzcTWRD80fYyzuxjbFq66R4K22CNYPpgFpOm7Vg1b4Uk+sxeDANK97gJD6OXTc2gHl78
         lhNA==
X-Forwarded-Encrypted: i=1; AKwUvBwWd+rbBTpzwQouMWNmVjWs6WPFCTbpOpG7fwsZs3iLKzDYe7udC10BREZ/v1RDcx2H4N3eCmtK0jiIlUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+V4IE3waxoUPbqqQGQHJ6tCngIJVuuplc0+8x77ILfdyVx0k/
	MMEfnszWvKDr/JwZ4TVp/w8pJHUFGyw18EzewZ7WZR/FM668CnO8yOg7
X-Gm-Gg: AYBFou1KaC5T9jUokb9Cm/CZPaDk/mrpn2f4RwXrcDbdbuhOwKTRkJGZUsz84Z+byGz
	pbWvyBFncWXk36B1krao2lOi0lp4QfAqSbErruwdkIeKaJPfW3/DNEdainyprZykH0dCwolU961
	3IExbB6MF6TuWS8mjelpEiBYOOq6bqDmk3grzv+31TWgP1j17VTrbRBL0dgIKPvhOGBW9OqZ9YO
	WmmHy7EAnESc5LxPfHTVe4Sl553g4Zbd0AaCPMOH5TKRqsBau5YlQuiJpZjPozbqpSbapJnyyDE
	h2gu/zzbauyB8qB6cFFRNmdRGDAX8PrJCWF0yePjWi33qviVE/E+F+DoV41jV8bPGhglGlju4GN
	SGXzxawbnPsW99s36qZXKan0fwgnKEgN1tWFbtJETPTOKxqiE4R59F7WmVaRxukWrsyH0ahkSRq
	ifGarQIvBS/BoSgZR0F+dA+/bRSbcdndzOqYEI4yRJA6FkIBYt7kHg2y1RyNK009kmD0c=
X-Received: by 2002:a05:622a:1f8b:b0:533:96b4:8dd1 with SMTP id d75a77b69052e-5359faeacd8mr96963691cf.26.1791676530862;
        Sat, 10 Oct 2026 16:55:30 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b755c35sm49184081cf.15.2026.10.10.16.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 16:55:29 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Irui Wang <irui.wang@mediatek.com>,
	George Sun <george.sun@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Yilong Zhou <yilong.zhou@mediatek.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v11 00/10] Enable video decoder & encoder for MT8189
Date: Sat, 10 Oct 2026 19:55:18 -0400
Message-ID: <20261010235518.1078376-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791623422.git.kyrie.wu@mediatek.com>
References: <cover.1791623422.git.kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kyrie,

Thanks for the series. Test report from an MT8189 Chromebook (Lenovo
IdeaPad Slim 3 Chromebook, board "quigon" of the skywalker family):
next-20261008 with the other posted MT8189 series and this board's DT,
plus MT8196 decoder v8, MT8196 encoder v8 and this v11 on top, and
linux-firmware's mediatek/mt8189/scp.img (FW version e3c0782 Jan 30
2026; identical to the image ChromeOS ships).

VP9 decode: 240/240 frames bit-exact (1080p test stream through
libva-v4l2-request, checked against software decoding).

H.264 decode: the SCP hangs (watchdog timeout) and every frame is wrong.
The firmware has 'reserved' at the end of struct
vdec_h264_slice_info_ext (after crc[8]), not after 'timeout'; with the
current layout every slice parameter lands 8 bytes early. With only
this change on top of v11, H.264 decodes 240/240 frames bit-exact:

  	u16 timeout;
 -	u32 reserved;
  	u64 vdec_fb_va;
  	u32 crc[8];
 +	u32 reserved;
  };

I don't know which layout the MT8188/MT8195 firmware uses, so this may
need to depend on the platform or the firmware.

HEVC: MT8189 is pure single core, but the firmware capability makes the
driver advertise HEVC_SLICE (and AV1). The HEVC backend only implements
the LAT + core flow, and setting an HEVC format (here libva-v4l2-request
probing its profiles when ffmpeg opened the VA-API device) sends an
init message that crashes the SCP:

  mtk-scp 1c400000.scp: SCP watchdog timeout! 0x0
  remoteproc remoteproc0: crash detected in scp: type watchdog
  scp ipi 14 ack time out !
   scp_ipi_send+0x2ec/0xd5c [mtk_scp_ipi]
   vpu_dec_init+0xe0/0x29c [mtk_vcodec_dec]
   vdec_hevc_slice_init+0x88/0x250 [mtk_vcodec_dec]
   vidioc_vdec_s_fmt+0x2a8/0x450 [mtk_vcodec_dec]

Not advertising HEVC and AV1 on MTK_VDEC_PURE_SINGLE_CORE (clearing
MTK_VDEC_FORMAT_HEVC_FRAME and MTK_VDEC_FORMAT_AV1_FRAME from
dec_capability after reading it from the firmware) avoids it; that's
what I run.

H.264 encode (patches 9 and 10 on MT8196 encoder v8): works. A 720p30
test pattern at 4 Mbit/s through ffmpeg's h264_v4l2m2m gives valid High
profile H.264, 60/60 frames, about 49 dB PSNR against the source on the
first frames.

For patches 9 and 10:
Tested-by: zoan37 <agentzoan@gmail.com>

Two board-side notes from bringing this up, in case they help whoever
writes the MT8189 DT and multimedia clocks: the VDE0 power domain needed
the larb4 gate as a subsys clock ("vdec-0", as in ChromeOS's
mt8189.dtsi), otherwise only the first decode after VDE0 powered up
worked; and the VEN1 clock controller must not use runtime PM (VEN0
then failed to prepare its subsys clock with -EACCES in the noirq resume
phase, genpd marked it on anyway, and every resume warned about
"already disabled" clocks).

The board's patches and notes are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy

The testing and the fixes were done with help from an AI assistant
(Claude).

Thanks,
zoan37
