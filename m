Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125070;
	b=SKFFbUGfX7Hd+6PFIZeZjuNJLgiWp8SnI/1GVN5+JArngkDBZhlal5W5XPAFTAFCyD6E
	 gKvZHbhRu9KWgqeyar81i/b8bzClGopHifMcfjgcWCjNw0AGGr2qtAcBgjdi3RGMSzrqf
	 KGhAB5jk7xbQbXP51vthFT40jgViBjYlsD3GjPhjl5KDli0lyG7g8fbiZtlUgzIulv6BL
	 OP+TuRxjTSfGkJdYuU8/kF0+4a3/ZcEJQcQi0KPSKyW7toN9rA2MuGzIcQtmqo7vOJMx3
	 gGS5jNeemQydOJwSPXa/XMERxV1CGkQFqqlvfz2padcYZwLiylkVPZ+eseioPjur5UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125070;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=Iu845MHVDpV3DXDAPLIF2pBxbDGSh6irlf/SAmJ+xBY=;
	b=ODLjnugPuJO5/9t1Xxpe1IF0CQ9MU0EV4XZVYS5Zwf+HzoirWwJ7N36Wb5QdVezYLVIg
	 QT34i6SnuwHVxIy1dtfqiY+jaUFEMsLV5saXPiOPANW7+RDf3opGXlQtq/EltuAb/33Fa
	 /6q9gIWEpUGXoFZpVyFqM01196Ld+REJkzKgM8pCatsbGfC6cZ/yr/Uw1z3Rxk42mvu6Y
	 aZtrwimoX3E8zdd72I+Snak829xGcGeW4VEQA4FNQ1h1oiUAB5MmTf9KcVwv3sNFxGDpG
	 lgIaf8ZdFl+VUbsbVMN2kx9u1bzkabeBV1yXyVWJJqnFhcVO2jqeT5ThpZ8zuE40P6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B98606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B98606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a45b3f0bdfso250433b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125068; x=1793729868;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iu845MHVDpV3DXDAPLIF2pBxbDGSh6irlf/SAmJ+xBY=;
        b=mMAbZ2LDfa5Xrv3jUmCnnsJ34+yFxOZIn6kexbdh6yRcooKQUgo7yFm0kpzgS+jOTt
         KPVhy2ZwUd+HhNC9pYhytU8DMNUvnBZ6xfOmkWGtJj3WhgudLsgs73D+SC9LWWrzWGEF
         VqLhP1UL3bJXU+/3YJSsUg0wk1FVUl72j7kqepXKhHRTAEh4GeY34ugVTnLTt2BmDfu7
         wOueK3a3lsQJSxHjTc3NNrzAkBfQGmF5I8mlv0rQryPSor0JqWsOnLzI4j8w4m1lagNl
         WBg6Xd3UJAca/1Id75h0SUg5LfakYu4bGv/Yu+ofauu6qE0s1T75klBULMVaeyjDIIRc
         Vy6A==
X-Gm-Message-State: AFq9FYLxRzEOJgkiADFVQhfX01qqQAGzuTUE3HjjxEXvJO3W/rUKw7fb
	xKiii1ohVeeIwO2HAhKXt177UgXwvNe6r5QRLX97a77KWRHcaEN8jv43gsA1a9HPZl3wMgGv3CG
	5g9mazcLviC1cjk7c79A105U5h/tv4naH6pkNCTqRR0T1QgisMifa0OyxRgM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:509e:b0:4fb:a7f3:420d with SMTP id
 5614622812f47-55c0039048dmr8139497b6e.48.1793125068640; Tue, 27 Oct 2026
 11:17:48 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:17:48 -0700
In-Reply-To: <6a682bf7.70955b6c.323240.0052.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0eacc.f0fe5aea.79aa1.0099.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [acpica?] KASAN: use-after-free Read in acpi_ns_get_attached_object
From: syzbot <syzbot+5725792ce6a9938d1b24@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [acpica?] KASAN: use-after-free Read in acpi_ns_get_attached_object
Author: jeff@incrediblybased.co

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

Resending the same patch as an attachment; the inline copy in my
previous mail had its diff header lines merged by the mail client.
