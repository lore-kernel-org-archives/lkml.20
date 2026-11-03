Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718212;
	b=ulLkYPf1vg9bKYEQP5mahWtRBkILZS73dccG/6qwmpyhR21hVJIHCqhbcjCHpweNHAB2
	 RpNCJ7zByY5EvHsg8Sp7UzTkwIDzXg0SiDo2CItB1DeGRUWOmXnlTKp+7Id2oh7BINknu
	 r6ObBp9ANzHhyd2JJmCwVHn1/LBtzubeLlvMZKdTsQ6tx0O8B9XP74J+g1xwKgmJZ1ixC
	 Xph7k+58BkxDkqbirWAS/BIlQjyoIv1wn5gKkFN8YDkMnDLW9Vy5mQvrSlwLMGJe7q/xN
	 WWbz7CtVBtgvNopI9V+/uDTBH89GW8VLi6hJIJ+hGyqU+S7aWePIGrF0aUNZBVqUtuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g056Pcmp+8FL2GL1f0BbswD40eG44Du6pLXXgw2qNMc=;
	b=d7bueDfmbIE/cgL9D92u1iTepGtH6HSuzmasPVO89hdzeuceFP1Ix23B/NrfkrzwANSV
	 BV7c6upCBhLXcWTd8PmeADwlGPtECsYzg2HsgZ1O8zyhjh1UKGyVklnxtP3Is4LLsYFq5
	 i3ysi18eOe1PlYFqy90nrukEOHV+baB24MYF8UxEZbi5sBmOUUqUHLNTtlahYFG2YAJIC
	 Tg7ryXt35FyAYWDOrevIXNkkoTeg/wfvTkUVXUiBu1ESGmcCw4JbDDOTZp2oAMRHsB5uG
	 CwtyT6HBpb/xQWfr0wOxdggRTD48IxaIe5z+lcxSIncNaKZyWISpXGrn+7m7CoHxK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yGS+e/Gg";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99122606B24E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99122606B24E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGS+e/Gg
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfbf48b92so651391f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718210; x=1794323010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g056Pcmp+8FL2GL1f0BbswD40eG44Du6pLXXgw2qNMc=;
        b=yGS+e/Gg2brHmQIFKcvcA8WFE/0YsSnYABg8b6flh0yRDxsZdPoY0FBUgMzEO5Igho
         Tt0HjKIPsidWSIaKfIfEFEd7AtqGTTWqOH3MfzqeV5hSQDF/w7mTfbANMXvwdNMPPkqO
         IN7S/0BfoCCTiyA+QoUMCa8qhia0CIB2hyQmKGxNRO/V4MBBrK4qq6MsIM4ippXZ2TbQ
         1DhZbmfHHYRZrsQHIYFrfFguyxjFMxkddoxtY9mx/8zoXv489TAS4LEvAmhxhC32/O2M
         Y21ZBManZlkvsCPhVIcny++VOHOa2Ouq6E8G/Y4GnaXCorEpxOCiGu8pGvwj3Rgi3UfO
         hphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718210; x=1794323010;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g056Pcmp+8FL2GL1f0BbswD40eG44Du6pLXXgw2qNMc=;
        b=IF3VYNThTFmBhol6ebMJHrR0lz31UCSXZ8tJ9QoemLk2saLWxD4tv+dqG1+ONOc0vl
         QOYwyXxwaS/llNtVhIash80jo/Ia3pQiX9tCQVh7pAl04dFV6stAg381covb2Urnd1yL
         phE4bOTtBNLbyTuge1ATvE3gd966U2Negyw2gWNwEJAzy4a9ac8HV6mCYKbpPY2bmKAu
         Mctt0z0/H8iOilpnOUZPagkv3Foe4VR0Wt2/nkA5vLgguNhktEJjbVFe2DB52kUt46P+
         Lq6MJHiF64oaXg/SGuZZ43zuUf9P0SRaOVg8tNyY8lfbSiOP7fD8xeU6FuF3/ZiGc/83
         M90Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNBwCYC1RHEdvQ0zP9qbLyA+TJ4ddmYxDgT0XEs3Lp/6TxeZAK3PE3+nIoNxVRASXM70dJQq3rMenzQfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HqIV4+AL7i2O+QMRB9PNWTqiVB7MkfA0MXXX74kOMPQBMm0FF
	UWeRsE5Sf0x+gbkjOySHiBGDv+sEpfjJeGsyd4bEUX6qPWQPBxa+1gxkQUNdo6lR
X-Gm-Gg: AYBFou3PYcSDMEdXy+xKvhBf2R+xzP3lOl9IpYn0SvYbA2Wm3yHdQ7Yhcv1sJn3mZxQ
	N9pjb/1iitxevBoBGfOe0IzLF60HXtjEcU2MeZd4vbwcG2bUHmMnc1HdeFoRatOkkaXhEWI9SME
	tcKEZad2B/Wha8kIBwgFt0EIdniY4fDNTa2gf/W+5Gd49Z+aMDZemVJMMrgwNv/7fcSUEt5LMdC
	YFqRZOEKuJrelADff1t/9MkKeRvSjMIUQtndP1z9GRThK3mtbc0sVNfNFdOrf8L71wZsjLKpGqc
	Je7is0oBbLvIyOkfalI31fpHmYxBYbj0gZKZtEeXB7VfMBKfehkjpYrQ0F36TKCQ4iPaWpx5dgm
	wGzRlD3cOQKQSI6VglfmlJPd0gdTBoU8DqD4rmITcOf3c8hQZjRD1KUKB+QhL6S1hxYD2wY5FmM
	Qo1w/kabMMwileSGchT8K/yV5qW1RPfo9ZIvQRtdK2q0KWUfP0dZO5moqMaehDds85K8yPZnN8e
	hJ5cZ27w9MCzOiSMYP6kwVfdVNbJZDqBQ94AptwzDubyKx1l/eSLwV5vFzYrxa1B5oeUtGrs9/r
	XnpV8yuZH9q1gETC7DWIU9IHR2narjfJ9D2PzuAdi/GJh/8fFT06P6FOYIjByg/Ky0u/SwFa
X-Received: by 2002:a05:6000:2201:b0:48f:bb47:3d68 with SMTP id ffacd0b85a97d-48fbb473ee0mr3254396f8f.1.1793718209548;
        Tue, 03 Nov 2026 07:03:29 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:87e0:1189:3df6:ff07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm27317809f8f.52.2026.11.03.07.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:03:28 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Bin Du <bin.du@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: Re: [PATCH 1/2] media: amd: isp4: hold buf_list_lock while sending buffers at stream start
Date: Tue,  3 Nov 2026 18:02:44 +0300
Message-ID: <20261103150312.52812-1-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <bef07925-6a2e-48a1-a72a-127b390705d5@amd.com>
References: <20261026182442.229869-1-saif.elden.hatim@gmail.com> <20261026182442.229869-2-saif.elden.hatim@gmail.com> <bef07925-6a2e-48a1-a72a-127b390705d5@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Pratap,

On Mon, Nov 2, 2026, Nirujogi, Pratap wrote:
> I’m curious about the sequence you are using to reproduce this issue.
> Would you mind sharing the details of the sequence and steps involved?

Thanks for the review. Nothing special on the userspace side, just a
plain capture; the exact command from that run was:

  timeout 8s v4l2-ctl -d /dev/video0 \
      --set-fmt-video=width=1920,height=1080,pixelformat=NV12 \
      --stream-mmap=4 --stream-count=30 --stream-to=out.nv12 \
      --stream-poll

The oops happened inside VIDIOC_STREAMON, before the first frame
reached v4l2-ctl.

What made it hit was an out-of-tree change on my side: the sensor was
started from inside isp4sd_ioc_send_img_buf(), right after
START_STREAM was queued with the fourth buffer, and that path had about
a second of debug sleeps in it. By the time the call returned, the
firmware had already completed that buffer and
isp4vid_handle_frame_done() had removed it from buf_list, so the walk
followed the poisoned next pointer. With the stock driver the window
is tiny, which fits it never showing up in your tests.

To make it reproducible without the debug sleeps, I put an msleep(500)
after each isp4sd_ioc_send_img_buf() call in the start_streaming loop:

	list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list) {
		isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
					&isp4vid_buf->img_buf);
		msleep(500);
	}

and ran the same command again (my out-of-tree sensor start was still
there, the debug sleeps were not):

- unpatched loop: the same oops (GPF in
  isp4if_alloc_buffer_node+0x37, RBX/RSI dead0000000000b8), 500 ms
  after the call that queued START_STREAM;
- with this patch: the capture completes (30 frames), no oops.

I'd expect the same msleep() to reproduce it on the HP ZBook.

Regards,

Seifelden
