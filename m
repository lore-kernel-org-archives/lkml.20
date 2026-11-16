Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851928;
	b=UVJ9AjIGZKLiZ6uX6IoZtar+Y/XA8HJG3XbGbKe0tNdZOAIU5PddIISK4JsDmGz0PGdV
	 rX/9JpCoy4eVH1qtgC83G6WPyrG3NEPmBPWgLIBboiPneank1EVty88e0nr5LsYmrSbqo
	 0jaeANMjnl0qyIw+KEju7yzyKRkhKbI07zoj0sjDWRvDAbPoUTYcpbAUQ1kXQ4xCF+R93
	 c8RqqNfiIW4Ei/j6/GoIQ2Y5FEJOq209v3m/gvRj3uwOhkLDmYvQogoGpYk+OInDSV68r
	 vYdWorgB4Dys9hnGA9O3dBgxCgZQLUDwP8tpsBvgdr36eixzdXeghNwcBtNZ46JZ8uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g6TQmkuyMCXzib2c99Z9MWfPdjMzOohKSTeFZiXInjw=;
	b=ojWr/YAKrXt9CX/bFnwvHnyjUxEEgQSwL7gxpVDVLnrudXT9G3nHlbsbIatOi9P8HDZA
	 WFmX6sWsbQ45GzT2c3rebUnE6mT1gLbLjjpCC5Ebpy1pUMyrjUw5a3P2+LVMm3YfsAkGE
	 h/gD7ktUT8GcB+XRcv7Mby76iXDiLBRTJ4FxU1sdY/zMva5BPBi32zmokMmhS547pTnnx
	 1aq3qcExUo2bzvi54CO95lPrPiio092fHeVB4kkTvO5sSt0/3Jr09i7g5Lefh9uNJrHn+
	 5FMs1Piqx4O6Lwjh3lpUJ2Mkw9OoklAna+4bLbnQ0Zi9RVsu6lSuC7YBNoIO2U3+txA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCpb4BZa;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A203E606A88A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A203E606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCpb4BZa
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490f38e9688so89078f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851923; x=1795456723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6TQmkuyMCXzib2c99Z9MWfPdjMzOohKSTeFZiXInjw=;
        b=DCpb4BZa/voEzzZmHniSsTUU+Ycm8NQQ+HfPkgCO1F+GuXvZLp8y1d+9vlOc9Te+Pd
         9frQ3hOecIr1z/cHJsd1peJA+Ehp8+wMn3K5dDTnU4PUDPsnizoCXph2Tqte3qLR6oKp
         RyGvrwWdhOF2mYptdNRePnVltnpCvxe0/nllIkI3SbptJus0Qamns+TG7aZj6IJcmLwU
         6l8qH69ZLrsV0x2+Uc3c++6qxvL3J26yu/hwiPy/r/UQlXS7NqAAGtwYVNVCkQSgAkg9
         5hL2CRVlWQAMnoYTdw36mJjyzYLzJJOHmVPMWFOXAbFsKWs+Cv5QE2L0m0a5KH6Pdry9
         W5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851923; x=1795456723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6TQmkuyMCXzib2c99Z9MWfPdjMzOohKSTeFZiXInjw=;
        b=F7cm2zkFmGnlZQPlO0ahHzhsJrYOORRFlCpigJvaci0ayyPA8N6RqzNO4oiX59kRLg
         qxulvm9QpHBi5yAu3yvHvf/fy8nRQFKSlqHdzP0wqINfefYYnaU9cjNs8hXuUHOzRvln
         iAnnan4SRhIE2TtLTbP4m2wAfiyYs6+EM14fR0y/vgGP8RPRRf8A9QUX8FflmtTNZ2vV
         1MREENiRJi/7QJOQ2CrjcntFrqKicKrN1DkdZ2n0oeQeOhk4rovGDO27ByVq2CMsLWq0
         gNk97rGLbdOJwEKbDGzxE32PhyLj0fPRCBqCxYv//zf4v6FmWTU9Rop5qUnnm6lsr0Me
         Mw3w==
X-Forwarded-Encrypted: i=1; AL+hErH+fD1S19dEm62bO6viYOUU1ioHqSSIuEw4ijKupq8fHTWGfPuHQOCCG37qhWHWtIg1zXdRKsSJqw14aXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OB8SE5MdpqRONqBnvC38NERNbCgu1f4hK4X24qyJvexSjJ1/5
	p+ZYDQf+WgZshMZwajZZa9FwMBqRQadvdB1vQsYxeKpNPMWb97c8YVv+
X-Gm-Gg: AZFdTZemPdUnArl9xODNBUmKskfmj3ueL3RX0r3jqGb1n13EoABFy8CU04YbOpbxKbl
	dLYIl+4vnqHLkKCyzEXOGbzD6UzX/ixNvE2TixSg0jXs1xc6Rwh3O2SorZcC70UbbL3qL/citgc
	wToiyYGShT0T8JkHujMHcIbFtP11XWYOHOVo7qliEUR/Ki/YYpkIYJbdPv3GIKM+JbYF1MkeM56
	9+Fk8j0yorCb+/zShWnaFB1uiZO++GG8l2PWjjNPzrbh7rUnrsmsVi0Pr3jEizMshI2hBZdqb8E
	FRz1htuCvmr4fVeoa8wPmht6DtORdoFgPnIxKfqae/fRrcYilOrf/YJHGipbenLG10NwQvTb0SR
	YX6zFKsCxknhUAzMrvXV5ZJZZSSrOo1MvUFi2LwVcuggRnSOrFjRtyBTBNMW0qb28SBwt9LMjh5
	++GZyXzc0JzrpfI+OQ3234xgtK9S73Mirh85Mv8QClOFSRcfLUGaX0XfQ6a3rrliGFWZlghfYFQ
	Hvp02MrFpwZrM37mPoGeZlPIyrDIDlD9aVraWTGgLhe5dWygVKcQKn2+KAQu49tRv1LOFr9CLwD
	iw2TAwm5z4kM1G2QlEPYaxGeosACUdUH7Bff+loDm+NOrw==
X-Received: by 2002:adf:e18a:0:b0:491:d721:548f with SMTP id ffacd0b85a97d-4a3735b4463mr501445f8f.12.1794851923193;
        Mon, 16 Nov 2026 09:58:43 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm24171374f8f.3.2026.11.16.09.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:58:42 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 2/2] media: atomisp: Report frame interval for sensors without enum_frame_interval
Date: Mon, 16 Nov 2026 17:57:50 +0000
Message-ID: <20261116175750.21905-3-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175750.21905-1-volodymyrchapman@gmail.com>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com>
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

atomisp_enum_frameintervals() passes VIDIOC_ENUM_FRAMEINTERVALS on to the
sensor's enum_frame_interval pad op. Most sensor drivers used with atomisp
do not implement it, e.g. the OV2722 driver only implements
get_frame_interval and raw sensor drivers such as the IMX175 driver set
their frame rate with the pixel rate and blanking controls instead. For
these sensors VIDIOC_ENUM_FRAMEINTERVALS fails, so userspace does not know
the frame rate.

PipeWire's V4L2 source then advertises a framerate range of 1/1 to 120/1.
Firefox (libwebrtc) takes the minimum of such a range as the camera's
maximum framerate and drops all but 1 frame per second, while the sensor
runs at 30 fps.

When the sensor has no enum_frame_interval, report one discrete frame
interval: the sensor's get_frame_interval if it has that, or else the one
following from its V4L2_CID_PIXEL_RATE, V4L2_CID_HBLANK and V4L2_CID_VBLANK
controls and active format, rounded to a whole number of frames per
second. This is the interval of the sensor's current mode, which is
reported for every frame size; for the OV2722 and IMX175 all modes run at
30 fps.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795) with this file built out
of tree against a 7.2.15 kernel: ENUM_FRAMEINTERVALS reports 30 fps for
both the OV2722 front sensor (from get_frame_interval) and the IMX175 rear
sensor (256 MHz / (3430 * 2500)), and webcamtests.com in Firefox 160 shows
about 30 fps for both instead of 1 fps. This was build-tested on top of
media.git next.

The problem was investigated and this patch drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 046a95857..c83834405 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -576,6 +576,65 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
+/*
+ * For sensors without enum_frame_interval, get the frame interval of the
+ * sensor's current mode: from get_frame_interval, or else from the pixel rate
+ * and blanking controls which raw sensor drivers use to set the frame rate.
+ */
+static int atomisp_sensor_frame_interval(struct atomisp_input_subdev *input,
+					 struct v4l2_fract *interval)
+{
+	struct v4l2_subdev_frame_interval fi = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_ctrl *pixel_rate, *hblank, *vblank;
+	struct v4l2_subdev_state *act_sd_state;
+	u64 frame_size, fps;
+	int ret;
+
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
+	ret = v4l2_subdev_call(input->sensor, pad, get_frame_interval,
+			       act_sd_state, &fi);
+	if (ret != -ENOIOCTLCMD) {
+		if (act_sd_state)
+			v4l2_subdev_unlock_state(act_sd_state);
+		if (ret)
+			return ret;
+		if (!fi.interval.numerator || !fi.interval.denominator)
+			return -EINVAL;
+		*interval = fi.interval;
+		return 0;
+	}
+
+	ret = v4l2_subdev_call(input->sensor, pad, get_fmt, act_sd_state, &fmt);
+	if (act_sd_state)
+		v4l2_subdev_unlock_state(act_sd_state);
+	if (ret)
+		return ret;
+
+	pixel_rate = v4l2_ctrl_find(input->sensor->ctrl_handler,
+				    V4L2_CID_PIXEL_RATE);
+	hblank = v4l2_ctrl_find(input->sensor->ctrl_handler, V4L2_CID_HBLANK);
+	vblank = v4l2_ctrl_find(input->sensor->ctrl_handler, V4L2_CID_VBLANK);
+	if (!pixel_rate || !hblank || !vblank)
+		return -EINVAL;
+
+	frame_size = (u64)(fmt.format.width + v4l2_ctrl_g_ctrl(hblank)) *
+		     (fmt.format.height + v4l2_ctrl_g_ctrl(vblank));
+	fps = div64_u64(v4l2_ctrl_g_ctrl_int64(pixel_rate) + frame_size / 2,
+			frame_size);
+	if (!fps)
+		return -EINVAL;
+
+	interval->numerator = 1;
+	interval->denominator = fps;
+
+	return 0;
+}
+
 static int atomisp_enum_frameintervals(struct file *file, void *priv,
 				       struct v4l2_frmivalenum *fival)
 {
@@ -601,6 +660,11 @@ static int atomisp_enum_frameintervals(struct file *file, void *priv,
 			       act_sd_state, &fie);
 	if (act_sd_state)
 		v4l2_subdev_unlock_state(act_sd_state);
+	if (ret == -ENOIOCTLCMD) {
+		if (fival->index)
+			return -EINVAL;
+		ret = atomisp_sensor_frame_interval(input, &fie.interval);
+	}
 	if (ret)
 		return ret;
 
-- 
2.43.0

