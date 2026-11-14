Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636012;
	b=Z1mwTOtqEagHiGUt/JxJ6zq1/ZAEY/fZwugDOJlLYh1k/2M+9bL+idYUnLaosue9erEM
	 rowuPl9k0SjjuntV0q0GSLspGkLd1ASdh27I1npnrhC/AavbfqGjn4GbZtIzw0pO6aiOC
	 KjiziaQpL3zidzBV83iNf4+0vo4axu3WhLLlFkBdzlLSV05DP6HanLBtp3YbLSdPFp4gz
	 1D6oW8yWsXphnX+YdSh0FGtI1csI28/N46FUn0MaBNSwgVMYhkM0WiOJonqQ47eqaUyxe
	 HWFuk6F7XqMn2zYeJVp9gxsN8PSM6Hos3YTWSuffZ+i3sQd1Z1BewlJ/cqobtZhIr0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NfuC547+tfDP/ZnK34MTsgmeKITWfmTasB7CUQvzVbo=;
	b=Qf9OGr+Gt62PTC7sK8n0KihQBqb2YKw3InLvv6h41ZQv8GrE1jI36uWxTeAg6Md2ADq0
	 16yBwHqPGQYhkXYH1OUn2H3Rr80sNbQxu38zf/mEI3MbQEEcM/HMq2Xvjk5l9zIreT3Vw
	 UiwGrnIdzrJhc2fOrRuGQpNuKXw+pF0O3LoC5HNhy/Pt8nodV6dIjU7AEPE8LP79DDweY
	 LaSF4O2pYHsvxV674hys3ngzpWqjXhfBOGfCXt1Td9rHdFXICzpSYrhX+EnFDWexwFRXC
	 IrZEujV78D+x7S/qsmdF4dRwiouYVBcr8KeEFsEzIQ64DQw6HZuGe81oZcGX8uJzYPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EiKPqTQU;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E76D60A262A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E76D60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EiKPqTQU
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so1141127c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636011; x=1795240811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfuC547+tfDP/ZnK34MTsgmeKITWfmTasB7CUQvzVbo=;
        b=EiKPqTQUMCQoiFs9r/xUvD8DNKzfFBFi0GGeN0/JEQIr+4/yw+9louFBnp8gtkfNAD
         o7W6TAQ9+6+pifP08PqVl1CAClUbRhoS5hxLxZ0cco+iHjNDbimraaXo3RqXR53OCi49
         iqzrDU+HGdbjFBBteFyjzf4euwrtdNUK+UV+Fx09SyVmiefGNkGeishOfENAYKAOG5qD
         ztK47c1QArK/SZrt6IMj3RsKnvixtsueFTeVOmq//GvxjCqmMe7a3HUIAFjJbvpel62z
         HZeq0dsaRCjLL1Mq2SvB5wU0WikzgueXNoEx4DM0vlDbiNxpFOXKg5fcTCXBDnLKjnBG
         F0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636011; x=1795240811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfuC547+tfDP/ZnK34MTsgmeKITWfmTasB7CUQvzVbo=;
        b=FIf0Zhe+lXEEascbXDIV+3Bn/YD5e/Z0WObC+tdfGpEufaxuDDY+LCy6LpxT8G+xdO
         Rt9eBpofi2n2A2gWMJcb8ye248gCC+Lx1J2aZEJA31PMhcDQuhhObW0p3GLm3fxrWsNH
         2rCXkBw/VfPocNv0sgii2bKqtVPE8YZWhSXM11KoBKB13DCEy1AEemlvgE4lltazHq69
         wmHwnmtCB4KUmu3HXzWjuFcdJ+kHCbj3K7bcH7GYA48ZpHbCYSUlU2cfAbk/pS40K2iq
         cVBVBVgmRMcul6XIjNCOYr4EQn0htpIJghzGlFanK8qqvHN6PiIYtdZVf/3do3CA2Bdj
         ViDw==
X-Forwarded-Encrypted: i=1; AL+hErF9u7M0bIeAy1c64L1q4Cj+4RVKjQFCBI/44bkCXn6GO/zox7PsDGeRVFBasVaQdECiSqJ5LhMvFCSrhBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8ic2U+8R5lzk2a2EQyb7C16wc7tupp2J+NObGgR6kCriA/Sc1
	ivrzoQ6nwx2ZCWw8PrcB3QxuoNXHMdQ8rNTCws/sQGLbETay8alGt1kc3FD4ig==
X-Gm-Gg: AYBFou2HZbOpBOqCJpEvT2DnCgn30HwzSSegGQokeJAAX7zm2fKFPDDeItOIf+4ndfa
	c1Im1+Lfu8YBNJliVRWh70NEKhdVJ6Arzls/qMSlUYR7FNxOOw/qByfEwkcRr3ia18FVfatGyR4
	j3N+c2uiXxJ8DdkW6wKmEuMFJPP5XukmFwuvcKWFGtkel9zInvcvMkX2w2tG8+t7MExhzvd7nQw
	GDbDfJ0ESQ++/znuy6Hi+IFhTS+QynKtJGklDCzt1queBaIQsQGQOlRUnyyzyEuv+F0SvLc3WDf
	YflF7FcJHXZWKmrWONOHSXSLoiWXspfN5nKo1q78Y7MOWwXyHuRr+FYp1EQGjeD3iusa9lfnosh
	lf0h8ERJvUSSAoGSCD98SqwsG5aUuYCKsT44krg15942OuUVsN/uuPkPBF0xfOCIabWvbxZ7bBN
	uPQPqA9GTJGpSqZm7Fjp4e/BtowVJYK87TXsFF01UFya5tGV1ySkWWbdvQD9FP9y+k8577GbJgO
	hKIv7lJEFBF74d7Vy2uMA1P6FE+kE2jEQcafF337Nmiku91mR2fMaaFjotL8M3/hlEhCij4c/qU
	kk7k1DEhxVO3niTnx2vqtYBdguXfZh7sYL2lAL4YSyATRd7z3i6McExCtEWSSjan1G2naXgN8kH
	z7dFu+oQQOdFyuzl5
X-Received: by 2002:a05:701b:418f:20b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b50319d4f5mr4632900c88.40.1794636011415;
        Fri, 13 Nov 2026 22:00:11 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:10 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 21:59:57 -0800
Subject: [PATCH 07/12] HID: rmi: do not mutate shared platform data
 template
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-hid-rmi-v1-7-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Probing a device with physical buttons modifies the static platform data
template directly, altering GPIO configuration for any devices probed
afterward.

Make the shared template read-only and adjust the per-device platform
data copy instead.

Fixes: 0b2c7a897378 ("HID: rmi: Make hid-rmi a transport driver for synaptics-rmi4")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index a4406bc6af43..0a5d32dbe881 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -613,7 +613,7 @@ static int rmi_check_valid_report_id(struct hid_device *hdev, unsigned type,
 	return 0;
 }
 
-static struct rmi_device_platform_data rmi_hid_pdata = {
+static const struct rmi_device_platform_data rmi_hid_pdata = {
 	.sensor_pdata = {
 		.sensor_type = rmi_sensor_touchpad,
 		.axis_align.flip_y = true,
@@ -776,12 +776,12 @@ static int rmi_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	if (data->device_flags & RMI_DEVICE_HAS_PHYS_BUTTONS)
-		rmi_hid_pdata.gpio_data.disable = true;
-
 	data->xport.dev = hdev->dev.parent;
 	data->xport.pdata = rmi_hid_pdata;
 	data->xport.pdata.irq = data->rmi_irq;
+	if (data->device_flags & RMI_DEVICE_HAS_PHYS_BUTTONS)
+		data->xport.pdata.gpio_data.disable = true;
+
 	data->xport.proto_name = "hid";
 	data->xport.ops = &hid_rmi_ops;
 

-- 
2.56.0.679.gc527c65306-goog

