Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581813890EE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804801; cv=none; b=NUBnKIf39uaYpNQYoJn8J9D+RFPDvwuc4A0LZYLK8SaoLM62wInifsFXSWcQDyrjmfq13t1DrrDT2CXrrP/gcTL03jK/zWc3nDRBYP4QdOMfYudSj6wDMWlcDBhMzEvquYC4GJxR6xyQth2BJotAp2M86Ma+gQYmyFs12rKP2y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804801; c=relaxed/simple;
	bh=wpkEA3uwodU/PU3/gbkkjbA9WUXgO3SwzfpC2pZp1bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jV9boQmETj1S6aCRmDgAykAsKvU2lIXrO3GlHhCPtFuu6AxBsJkwrmTHh2zllGeS9wCR8f2RI8pel+O8+JfqQs79zdpgiBaTFIP2x+Gub58fmfnWgJ6JWvq0Gm+KydI1Df6NogOlpJOH2fUP3Ob/fQ4tqCd5C7LZfdltBeXFAJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cG4q7Use; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cG4q7Use"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d530328efbso2947885ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787804799; x=1788409599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fsygry22qQnjiHZyuRcED7KjHJNfEol8psEK33LfexU=;
        b=cG4q7Use9xAv/AYHKCU96p0CINjC1VGAG52qp6dW0w3WMr26CCL3RxGCR/NI+3pcqS
         sz9zCy3XCRIt48wDM8gByJFSNTYSx4F18X6JGOLUNej2jHB6cu9bC9afThERno5E3ErJ
         lsAgJdmpa9JKXQbdGUNpDmx51GH4K5B+ONBmSNWX3qAWY0wgQBp1Sz7nRdMl7RZkxmgA
         p36FOPM0OCxjufjCXsPs7wJGxyP48TKoO/0Q1rV8s7MNLZe0ck3TTLXA2uwhRxxuRMOn
         W3PJDO9p5WtqJaktDHDVTQCJ9RgRbBIpb8QczxRxiocXNg8D79yr7CJ7EkLkxNPCGmK/
         HzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804799; x=1788409599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fsygry22qQnjiHZyuRcED7KjHJNfEol8psEK33LfexU=;
        b=FjB3AI7eq0Dnwx5tifJi8cwWsNmYwyfXPumSYhkM62uDdSuyJ75fnURhpuojRMvDg7
         ozGTfG27itVM+4BDpn4o3ESTJM2EtLQ3bJ7rGIwXf8olnLNxWC4sNlCt5yCJhII8sM4i
         Lsny1h/aaVs5bh3e69XY5z/7ecY1tnZ870e6CVMW6pEL0ltXSJzhVgdWaw74UioSheBK
         C7medbwRBEdxoKzlQAYfuV2tyVnNxJ92zReIzT0T7EE4D5JTSx5PHRwuhGiEl69uAtLw
         feYhJOOselBwm/W9GG8c2/OOMlOqCNse8dPs6TWv2t1XVv81sVIqRnp7sLam5VdA+ZGv
         +Jcw==
X-Forwarded-Encrypted: i=1; AHgh+RrVbOjR32TmFnixm6JUoQnoK5OtHn8hG1gCYz3ZsKcPnFAC0HdttA6FvwSSt1KAHmUa6SC6DR3WA+0lgt4=@vger.kernel.org
X-Gm-Message-State: AFuF++nwdG1KZAU0S+zAbnDYcpVIfVxZt8WW2suojNYoupY8IJs5Q/Bj
	KOfB6WcSKTVnExMhFdbEEdfZwIgJmPDpQERlE6tb8ftYGDmT2HR/vsQf
X-Gm-Gg: AR+sD10U+DUOLe/LV92V3NbkUaCoZiNMTwd79oaDxjR47j5hM4Bf8mApyQrnc2IEzdL
	dwqgseq64QKtEKHbnehZ71roOVBzYzL9v+8kj3SRBRDzLFMOPHQXLaGR55Z4NExVQs2kSCYpPv4
	+sc7WgDXR6wy8I9jewJZ6C7JTzhPZoa4Kdj1urwQEb/bjKn4CEsBDaBQXIkYkr8jHzYJbYkL6jQ
	DKtRfsaE5lVuE3HcKW9Sfg3f5KUGd/B2USi6Il79Rzf36kpkxCSL/Z5PqKBRt+24mjau9qdZLkV
	sbH9LK7/dFuDRqe4WKuX8uTeCy2xOFEZfi3LcBodFHnExDR9kTNN6dpCFN3hhcbNc8J7VxXMMOL
	5NmNG4mpoJX0ZrTBV4wc5qkqSTnfjP/8QKGXYuXzeC64FcLMRzJbVExpMsPvcRFa2pXTMF/LBzy
	qIcyIk1k11SIPnXi82Kvsb3L3PjoVXtXjmVVqgOmH1SrJ2lhA+ALlq2G9U71W2D5mObA==
X-Received: by 2002:a17:902:e550:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d707b64aecmr219904355ad.12.1787804799444;
        Wed, 26 Aug 2026 21:26:39 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm13662685eec.23.2026.08.26.21.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:26:39 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: jeffinphilip14@gmail.com
Cc: dwlsalmeida@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com
Subject: Re: [RFC PATCH] media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail
Date: Thu, 27 Aug 2026 09:56:15 +0530
Message-ID: <20260827042615.12777-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827042229.12561-1-jeffinphilip14@gmail.com>
References: <20260827042229.12561-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>Attempting to unbind a dvbdevice that is in the process of feeding
>data causes a UAF as we free the underlying device without
>stopping the feed first. Fix this by stopping the stream first using
>vidtv_stop_streaming(). However, our codepath in the reproducer
>(mentioned in the below reply) does not decrement our users
>(dmxdev->dvr_dvbdev->users) to 1 after it has been incremented to 2
>by our read() in the reproducer, that is only possible on .release.
>This can cause a task hang as dvb_dmxdev_release() uses wait_event()
>in the wait_queue unless we use a close(fd)(in the reproducer).
>Is this a problem? Please advise.

Reproducer:

#include <fcntl.h>
#include <unistd.h>
#include <pthread.h>
#include <linux/dvb/dmx.h>
#include <sys/ioctl.h>

static void *feed_thread(void *arg)
{
    int i = 100;
    int fd = open("/dev/dvb/adapter0/demux0", O_RDWR | O_NONBLOCK);
    struct dmx_sct_filter_params params = {
        .pid = 0,
        .filter = { .filter = {0}, .mask = {0} },
        .flags = DMX_IMMEDIATE_START,
    };
    ioctl(fd, DMX_SET_FILTER, &params);
    char buf[188];
    read(fd, buf, sizeof(buf));
    //no close(fd) here
    return NULL;
}

int main(void)
{
    pthread_t t;
    pthread_create(&t, NULL, feed_thread, NULL);
    sleep(1);
    int fd = open("/sys/bus/platform/drivers/vidtv/unbind", O_WRONLY);
    write(fd, "vidtv.0", 7);
    pthread_join(t, NULL);
    return 0;
}

