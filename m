Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDDD37E5E1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540200; cv=none; b=CBLDz1YfPN+R5/om8rtrZrPKNJig9f7vaSRY/k2wgfo5mdyFjoGdWf1maELO5Alg/WpzKdaz7LOdetSRPqhT9iMaYVVJJuGtq6TJpTYvYKB4u37HNVodUe2QGAiyPXPooD/fAJx5BGKpcqkSqXoHfWL27Z9uqscg5fwFAgYmqLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540200; c=relaxed/simple;
	bh=Q/HV2llP7Jb38DEpJdoZVSsTLp6NrnzkhfOKfcleIRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QgC5sL1lPl9dYU+0SonAN+A60Dj0Gg80P7PCKDpjJ4ATf3qwMXhZjfnxfeTxNWsi9i5QsKoS5bktzvlJco/3pCrgTia1FtCETbqpKhIG2xrG7DcbcwcXKc6tBB/JQ8pr34xuEqrFx49InPzwuovSfI68cKgteGCilIfn7SFroVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a00RYrE/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a00RYrE/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so17429425e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540197; x=1791144997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DwzM3O07KV7Ad57WiPSYsZ9aBNzLTCUxb/41TDBZ/+I=;
        b=a00RYrE/s0JxPQfU6HfiaXJW3Trb0hbuoAT6Y7irJYycHOojd7kbi7CWQKMLdfikiS
         BwTriYww9TFJcPZKmersngywvhtZHaO8KXWL/RaIoYxgQ/UIOPj4XOsgdxNT84qmNkXa
         03QoZgarabOHVg+TuB5871MH+C40FSrDsHB9wFLIbqUZ2g11ttQtnM4qSvEkSumk7LLU
         FfsPhgmpUNwI2xHtHHZoFzCAYNKW5qOsGUB67NYTUgQJJbLoUB65yaPjhXLpxQ12gSXr
         HUIVbMlt/mG+qkaKpkh/bQmpg2A3nH9pU4r/S2j2sRJHaf6VdZPpdc71sm4Yf7tik03/
         sOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540197; x=1791144997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DwzM3O07KV7Ad57WiPSYsZ9aBNzLTCUxb/41TDBZ/+I=;
        b=ChblBk7EdO8D/yM/tTUgnuZjigEE2Y6Oct+4suutIy4aGHmpEQYMrsMnTWVmL7tsQQ
         XPkZG4umMQKdWGDRybdstdjvZSrCLgB2iqjMmbFKt3PFflYNaJkkvQ1dikMwsf8hyNNd
         vHgoqrIPfdW4C+KwBuRBOtW5cRgfeLK2y8RCLB3njNLCNr3Oxk2m3tFFmC05skZmqzKi
         IlFjBU555qVL/MGvUztHRB0f7ReuvA/Se0Tzvj45pnLADKrghGs6CkOIzr9kUrRvAu9G
         paDqml26S8ultS8TmHmFT5PAm3WKkelQMNLhuzhKqCaEkQvs38Ao9pSexEHp1P7YLbOd
         n+iA==
X-Forwarded-Encrypted: i=1; AKwUvBxlU9NDrov1sp85edr8TVnA76+B/AOzkQPkBlIHUms8XXnnRMN63wQIFpdAU/IGQWdxQqxmxU2Z2t6d0us=@vger.kernel.org
X-Gm-Message-State: AFuF++nO3/CDaCSE7sCKBeVMyvY4Yo/pPJX5SvHXPkcq2t5PUELp/9rJ
	E4oOxyE/m07oeWJ7pxMRBbWvneT2MoeFpboqkI4830I5YjWHczjKCaLf
X-Gm-Gg: AYBFou0iripWFwU86y7VVhrcuB5OFnFm5Pf4eNhx9UV7eIe8fGEEU6n4KO/wqJmkeIX
	fG0IjDGO7rdS1DMy+xxrpcoGkIRxZ2R4CdjPJMKeIKeBaF5hParPtzfCMOsKIz78Lx0YMVkrMrW
	NYyTSqSxqmnynCIfoYV+B66fevN2CL4UqOwLgz0n8gItSGAda4hi0eRQnfGYqnBL+408xNx3zyp
	3WbJKVeE9h0CG/yAfV4Q1mHHYe06dbelqdxyENFR9AGtiRkO90JyC3c3cNbnK/IGmnmajRpF7Iy
	NY/B4vjAd9cw3j+a16T6/XrRYORqpmHdso0Y8Fu97rcjZS7hExpZVIPBninhkW2K1ssFizbhGgc
	KhskOS6rMZCLoYKVw8FhkH1Uu3a//+hv23EgPxWlNKYHrfTGu+x79QOWV5y9DbD06SQ/gXUDt0C
	rTk/JLUP1tG85REu+EWrEb+aBUGOd9YV1+VJ3eUQMolR6bpBEIalE0+UPfa+j46it04fBSNvh4g
	H1eRlpW1s468ORiIV/7RmzxgxbJ5ykomiFIkxleYgJpOuFPaJKIBwK8Dr8=
X-Received: by 2002:a05:600c:540e:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-49fe66ca828mr207735675e9.10.1790540196420;
        Sun, 27 Sep 2026 13:16:36 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm24576000f8f.29.2026.09.27.13.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:16:36 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 2/2] media: ipu6: Check the ipu7 output pin queue before completing a buffer
Date: Sun, 27 Sep 2026 21:16:31 +0100
Message-ID: <20260927201631.153126-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927201631.153126-1-devnexen@gmail.com>
References: <20260927201631.153126-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PIN_DATA_READY response for an unconfigured pin dereferences a NULL
output_pins_queue entry in interrupt context. Check the queue like the
ipu6 path does.

Fixes: f268203d74ff ("media: ipu6: Add ipu7 isr handler")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index 19e063b22a15..dca9c8fbc3ac 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -638,7 +638,8 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 					   struct isys_fw_msgs, dummy);
 
 		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
-		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS)
+		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
+		    stream->output_pins_queue[resp->pin_id])
 			ipu6_stream_buf_ready(stream, resp->pin_id,
 					      resp->pin.addr, ts, 0);
 		else
-- 
2.55.0

