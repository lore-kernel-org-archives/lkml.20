Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689860;
	b=qcrTX9nS/0nEFk1yUY6Y1aOj3klxpAQCbsdftk3URCvO5HPU0iP0XH/kb/ZGL1/UMJJr
	 oeJ9L0Byq99dhQy5CiEOxzqXguuHsLRpsGkJZeQDDqpVnULuQjO2PV5If0NmnbVLAHvgH
	 OnJS8OvMLZgdfYjNbYrsN40yJX+eEQtEnaRY3HytKFcDQVnRFVo6B1xVoJwuy/pxQzlvH
	 KhB9fWthdkkJlGwe9SpVqGdcIf0L7b/7fvPaCe0eNngI4MM3xpw6Z2O+MNFZORyytgDK8
	 new7h8YF3V83p5Midv3mQqwPkjYOrgjyVUfaBSAMZC3MWbTTHNCrjpdvQ1/svdmb2jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689860;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=00gfMEwpbvoALO5tjO4l12QhAe6j/a6+cHjt01SCtDM=;
	b=4eLSt2L7VfMBracqrPqpSxnWQBnxSi3GlfcfewNptSswPxhiC81H3dj076YSjuua0QEl
	 2IucJl4PvgV6/9DJSr5j3OyUC4UubvcHKqKdnAiD5a3/r82nWXPnn407StM3o5BQY/OKK
	 3mz+CUKhh2QNmeF00BsIs+4sltoq0VkUiUaXHyhlgSwFDxlC2craCobu4/rZNXVtb0JUO
	 tHP1cmefoeD0O0sjb91lkx55p+tdPd+PWsFtXPCWL+yVG3JmCkppBbZkaTushbboXC1+c
	 IdFfuzLGUOv7i/eDioH65X66sxHtPSxj35TjhvPWuUdsfPoSDC/MViVKYHdErXGDTWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27AE606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27AE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c467e19391so153189b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689859; x=1793294659;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=00gfMEwpbvoALO5tjO4l12QhAe6j/a6+cHjt01SCtDM=;
        b=JXlZSUq6NHZcXCvu3L65TjBXBNWYabtXx7Pf2j11578ESPyhvFEtr7X1nhZmysUnuX
         I4WvkK+/ZvhIh9EDDVCHIJfIgD0/5Ydz50+Zrvs5eVA8+oAKqZ+HfpPuf7LWXGQoHKJX
         4uxKNwPkZMBkRkOclKely9otqM0pTWftWTO5ikvaeg/7NFSAfsRX0RrIxoDqBIiMQCwc
         mwBb5PCR5hL6dEPVlI8peZLbjg7KbbTi20tlqabRlzVJD1ODrjLGAhxHG5geN6mQY3zo
         2Nu8sLdWCVahqdJaczEXZygBZt7T/jZoGnGofp4pZztFkZfggPy0I7CFjJBfP83tiYR/
         NSug==
X-Gm-Message-State: AFq9FYLX5e953n6WyIrAjJzpjnwt5oBYPDhe0RvysUo7uI9QHqclhb1d
	LbirBq/bf5hFnFwfnCn6AdbEsNXvaMho3R2GLoHHKexPsNI8iaeDl/fhZ7nHXCqxRgAxbZiCT6U
	gI3a5iPrRtXALX2BgHjpzWAAAqNcai6K0xZN56vp9NkjThQnf7OR6RE9eECE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ec2:b0:4cb:26a3:a0db with SMTP id
 5614622812f47-5535d9b1e2emr3535266b6e.39.1792689858997; Thu, 22 Oct 2026
 10:24:18 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:24:18 -0700
In-Reply-To: <6aa9c7f8.a211d2ce.1a5198.02b5.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada46c2.d1c214cc.659fa.00de.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [netfilter?] WARNING in nf_flow_table_extend_ct_timeout
From: syzbot <syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [netfilter?] WARNING in nf_flow_table_extend_ct_timeout
Author: mike.michalo@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
