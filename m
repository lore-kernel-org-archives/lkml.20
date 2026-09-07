Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A04756C9;
	Mon,  7 Sep 2026 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780990; cv=none; b=iONoSSvceA7jSYwp/3kuSpj/eRiWZZGv2bFjK7LU5gOm6Orkb8p6a84hjwd/GDUzLhcpfvFStJ+o/GbWglfr+Y8n4WivspxALEyF+N2AFs7LNM4JTX95zFTx6GD3fzk4/unCM4TGxtjZyLuBVmo8H+XxYe2zpN5CAfZ/nwkZoqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780990; c=relaxed/simple;
	bh=SWBIK6gGMsz7pNTKU7LU4Pfbs/fX5wTd4qP8ada3ezo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gA4AW8NRgbt9+TBzVzVpx3OXyyZ+O8HnwDSxQ4LnFIEBZNRr/2n5fnl8pUh3vsSC9ZNKezjOE1bngyFpcB9wHg6jaQpkgFZOLlXlpwAwuLIuN3JZ/GzpNijflfeFIVNBsv73nIADYLaqVoiVbDfYL8pUAahP6pZQgTLJ6o9FYYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eUZmKWO5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eUZmKWO5"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB5F74B0;
	Mon,  7 Sep 2026 13:34:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780893;
	bh=SWBIK6gGMsz7pNTKU7LU4Pfbs/fX5wTd4qP8ada3ezo=;
	h=From:Date:Subject:To:Cc:From;
	b=eUZmKWO5GYyv4gicwQfj8OhnyLfGCKHBnVAtLOhu1M4uZ4IMKKsNCtuYpGWNVD5pK
	 uJlHYPSJ/YbQqaZbqVdrXGz6ySOnj4RfoKqDqW6kKKk+oWhKShfvCSTaQ1i5k5IIVw
	 1RnTazKF0CbOmaGzJi1n6VKmE1tu3u1IcVJDlWYw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:36:09 +0300
Subject: [PATCH v2] media: v4l2-common: add Y12 to v4l2_format_info()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-v4l2-format-info-y12-yuv24-v2-1-46d8689dab95@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAKihnmoC/42NQQ6CMBAAv0J6dk27kiqe/IfhUNpF1khrWmgkh
 L8L+AGPk0xmZpEoMiVxLWYRKXPi4FfAQyFsZ/yDgN3KAiVqeZEacvlCaEPszQDs2wCTQpjGjCW
 UeNK2qSplzkasgXeklj97/F7/OI3Nk+ywFTej4zSEOO33rDbvr1FWoMAROiu1akjijR2ZFHwTT
 HRHG3pRL8vyBdvLCXndAAAA
X-Change-ID: 20260806-v4l2-format-info-y12-yuv24-4236cb991a7a
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vishal Sagar <vishal.sagar@amd.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SWBIK6gGMsz7pNTKU7LU4Pfbs/fX5wTd4qP8ada3ezo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnqG6iMyfAs+UM/Dv8EblCTU60M7MXb0boTmMp
 Mv3e7FiaDaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6hugAKCRD6PaqMvJYe
 9QUuD/0YVADZUaZQ/9yllsbBhIVGhQwejIamdK6ZPdZEQeaqhFWIYUiFeglqYPqrjPsEfhknEj8
 nOkzn0HiYNAMVetM7EQqzNiLfzS/HY1TFIU0nntxLjrB1WVQBBIDx4ff7rGEn22PDp1Rn8qP6EP
 M93q0yU5MLEfz9t5j/FciyYX9ocpcE7hICyTdLQE9a6krnZpavN6nm528X8fzL0aO9QjDaggWk7
 qBYmM7q94LZRGdV21fjRoSFnAmf/MCprKXlPJaerF85aI17zJM04Tj+w2EY7g12wPf48X1Z55TD
 lKZeWpeX+lzePqv4EGmKHaL14cPmY6gNp9zk6e9xd9xjgziezecrcSYU90Yod71OhebFq+rQElC
 /EQTGGav3Fzbq1dAGwfcFkQ4PZ636Xy0fCecCpRwKGEM80XrqL5fS5cC+IYdAdZNX8yCTPvxvRD
 AdlFIRYfEt4uegHKYHOrlwJu0rJUdRGjZWXw4MI3c0qAIZg5zj4PDP4Cg4irQJUyrilAadlMTT2
 c8QddMNoY/69u5+d6O9sQyLPpb+73UVK8BGt8zZ9CzqEoPTsYLHyDjNpR2WA4ewfGyUYOSnaO21
 T2kAVxkX6igPaYAe1sW/Ln4eQgJvP6yBIhQUO9hpG0i7udABgR69ZTgem0VgHQ/4Ct2SakgN3Va
 63UClTdH0d1epKg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add the V4L2_PIX_FMT_Y12 (12-bit greyscale stored in 16 bit container)
to the v4l2_format_info table.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Drop V4L2_PIX_FMT_YUV24 which was already added upstream
- Link to v1: https://patch.msgid.link/20260806-v4l2-format-info-y12-yuv24-v1-1-de2dc061be02@ideasonboard.com
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..5920941d7f60 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -333,6 +333,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_YVU420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_Y12,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },

---
base-commit: 274af88c8acaa4bb538791047bd17fa5136ba78f
change-id: 20260806-v4l2-format-info-y12-yuv24-4236cb991a7a

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

