Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719647;
	b=4msl4qL2RTP/jIKJqen3OmHO3MCtmXP5FTOUr0J+ipnm5YL+4fwCqDRfHX+1WNgJUZAG
	 cVOOXchjJMStwPDe568/O72PAGYBAFNEPciTEdLdE6msikN+mlyVuXwTTLiT3HSPcAygl
	 DPh6XaomeXKqN2FCOwnT5WfFk6t/wRvoUINZuU+C/+j4lRul1bhqAuv/YLyTQQaE/HmOE
	 VzFm/kMfLTFztWCl3pmaee2so4BYhpIKVYJajkrF1dC0SjOKgRXidnCxrlZLh45+T51xP
	 A57/viz6WyXic7Z6Oe0MVPEhwlVgVXI+LbPrgfnYsr1cFOdKKGLwLt0lJIkvgG28kXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TefUIXXlEMj5cJFFQ7uazOLXteD1gLPFTJrdl5Us/To=;
	b=yMxhug66catosU91Efejo4aKK49MqmGpIpuFEIRPA4UaYK9cBT7w/8wxSsLZ1+RjXhs0
	 YBJY+o2RFjq/Bmvo9g3bsXvmG3GowRfm9xALnCP+F7eczFfzd/kfCt2fqXOl5zwFGTJiR
	 DY7PHNR+Jp37J+/9iHMfJE6/S+9j93PQAqvxgHUdaKE8WDtVrCTGh6AUC5LdJGMQMz3ZK
	 UodUMWsRju6hajPHRO8DzK3VKdsGTysGcD1jLY67ZWEFMNGxCoHqblF6/qsPFbvB9JldE
	 lgij1fg7UT+KTXDrk1TgXB7oubOeYWugOBtZLdB3tnoK74sjvTVUcZhz1rPp7ApWuiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+6z3ZBL;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8B0606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8B0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+6z3ZBL
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso17852135e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793719645; x=1794324445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TefUIXXlEMj5cJFFQ7uazOLXteD1gLPFTJrdl5Us/To=;
        b=V+6z3ZBLKk82QKKtTa6ihXRrYIm3LM3PrY0Za1A4R4W1/EcMtKYB1U1s3+59MrOxYc
         uRplbE9bqrWlFz4UhTKmuTXApu3+8rtVrywH0mjD8otCSaT34BkUI8a6TGEDmhClGf92
         SWj4d41oojfr3oPKLa59ylMfiZmEIv+S6SL4T8drMDhZgaAl65vqCRS5rHcO0qzysTnG
         xeL9KHuZhnm/APUS+g6hFVN4rICM++ouQpbuwhzoIQ8enoL3xfpq917r5938aIW7SCxK
         SfMvPygU90r2MqszREvjU6JF9UPVS1zPY76BqPxWOfeqfttuj0zXB+sNICY1HoFqpuSe
         0NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719645; x=1794324445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TefUIXXlEMj5cJFFQ7uazOLXteD1gLPFTJrdl5Us/To=;
        b=LbrKzpqqmw5Qyo4RH2eaPzxFKQ5NpDGjZiaqOTs5mEIZyfQWbKX6/iSXzf3afSNROO
         8dAJZSaIzvb24xu6au8PkKcwSqoQ59UgthTBhpjPcfVvRt9RqLFOc9G6CM3OfAzNlwbM
         kqki/SpHnHpXR8qftxyok6t7atCX0Dl9JYTZ40tm4SHe32h3pasBvMcqh68eYqo7MBiu
         0e+aJ1JG4fdxOlQOq9W3Xaz5DvgVG+fxcZOWrN+2Maogv/Y4RLZoCO4TalPfjPfeBA9k
         YhXbpNnGugNu20QjxvhG45OanaXsxlBxkETthqhEe2lEfC07YgawIA+uDd2CxXF5ImC7
         JSlg==
X-Forwarded-Encrypted: i=1; AKwUvBzg4AhFIGUx08u2Dgr4U4Go7uOgKPJdU6mRkwCfZctQQNhgaA0uyrS/+47w0tXBBWCxoKiqLOWLFH2V4tI=@vger.kernel.org
X-Gm-Message-State: APuU4Z87H9cfic5N9RNKzEr7yi4bVgg2IGEKpXxPPtoQ/he3XZ7d3y2g
	aXqsvp4aeRgr6jeckYrDW43whbgUqaUzSmjdJUNhmUgLIHhntxwXCdOR
X-Gm-Gg: AYBFou17kczIgFlgVitp5K5bfZB6R5J0aZJf04eIt53AGGNlAdBQHpnKH+W4chDNibj
	XAA16v2EBvSGpg9InBbunEa/ZOqIXJAdgKuN48tOsIUVPSdcmeyXda7dCpJQHvey21lBZXs9Gv5
	UVKUMPs/YwE5zqWZL7UH894SbMR3QTsGwB/dUb5chA6OAuBQkI6296xoDglTYYvhQx81Rf/qQu0
	jhOUD3b3dpEdbNeA23R7gpd2rJfp6LgW6J5ql4e/heYIj6BCdmSYI1v/BqbuVBa8DQ9Y4/zb1SP
	L/sUO33ZlfE9rMjaClgdl7jALt1bS7KElVlnPjnQI1eS1D0LiUdJlkqxpW01VvQsKAWp/3ViRIw
	3msLtXg89XFlL4wMvJpCjxUjNNAMb2RZ7ntoTyLFGd1z61QmFZio0YbyKoKPNCuQVmLQNc+e0iC
	u8HhczvHv2StrUSVeDpwYotLmK/ctNyd58D1WJMJg72zw25/g/7FpB0NV4lM01eYxuE+kW4pDoi
	GKamcs80Qgy84ywew9uOTy+6o5IHuW45yj6g59dvPngbeXbDswtDGpaC8zo9QKU3p3rhD/IqDe9
	WhhhsKFb2zQDXTHv3gt72QDuagA/+Ub20hSUDJqajgi16u7oA6f/cKLJLf4bN3Zkk+olQXUE
X-Received: by 2002:a05:600c:a293:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4ac17d19a54mr202178165e9.2.1793719644922;
        Tue, 03 Nov 2026 07:27:24 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:87e0:1189:3df6:ff07])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa481a45sm60171945e9.7.2026.11.03.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:27:24 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Caspar Adriani <caspar.adriani@proton.me>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Yifei Gao <gyf161023@gmail.com>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: Re: [PATCH] media: amd: isp4: fix self-deadlock in isp4sd_start_stream() error path
Date: Tue,  3 Nov 2026 18:27:07 +0300
Message-ID: <20261103152707.90152-1-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-isp4-start-stream-deadlock-v1-1-babd80273148@proton.me>
References: <20261028-isp4-start-stream-deadlock-v1-1-babd80273148@proton.me>
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

Tested on an ASUS ROG Flow Z13 (GZ302EA) with v7.2.10 and an
out-of-tree setup in which the OV13B10 streams (NV12 1920x1080), with
this patch applied on top of my two isp4 fixes [1]:

- stream with the format set: 90 frames;
- stop, then stream again without setting the format: VIDIOC_STREAMON
  returns -EINVAL after "fail to get out prop" and "fail to setup
  output", v4l2-ctl exits and no task is left blocked;
- stream with the format set again: 90 frames.

No hung task, oops or WARN in the kernel log. I did not run the
sequence without the patch on this setup.

Tested-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>

[1] https://lore.kernel.org/all/20261026182442.229869-1-saif.elden.hatim@gmail.com/

Regards,
Seifelden
