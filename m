Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622374;
	b=4dWDmOI5duPsWvwhXQ9YZFQKXzrYVS+q0/8eeOBw14/4FiKN+V5WI/YTRtbsZJBd7/dG
	 9/gEHBIwGWM84vw/6pZfcsc8TSM4qdiqn8fEWJdi7Ni1s0oPGPIWO2geVV4jPDQgRQVly
	 zTl/ui346zheUDwX3D68kEmYlTlaQbf7zsxg/az1fDI7DEdKtOFNq7BvXhSG7yHlZCxQ4
	 Tjk34FTu9EkqAurQ1KXT4OjiN+/Rr4BHlQrKdjcyu797y5s2v2UEx1W/qdbybQV4EPxoG
	 hjf+I1uKNoualAPM1CV3B4P0kFzw8XsBFvAmk0lQKdq/f+r4Sb9/ilTWxW35EyOdwxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622374;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=Yk/3snzscfu7Vm9ifwH3CUsIk8OR4zOpQFjkwqXlhNw=;
	b=4PxDJ6+XB6uN0GgR97hiwqklKFeSpripOncPgk1bCjSR07c4ZkkQPSt/uNWXNE6OqsWF
	 NfxY8xekBBJmCGYgkDMQSFM7WdyqSsQ2DPifrPLoQYFGiDijv8/S0sPEd5tX9pNG16rCo
	 pxH8IX7OvDM53I4TMupQDKx4GkaGqFbOHM7zwqoxik9DUAKZHZR4bvLM90QE8FjNKBdS0
	 tUMvcYLITzMS+JmK1ZrkLOqeFux7prLBYy0lKb0lYfOV2p4iIXqHUY9pJSyv3U5cT53GE
	 yq/rNbPFdmVWMsoEImbZqTxL7HOv5cy0JBiwMP2+NcgMtBgtRdwpuoJ8/2MDfNKcfog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E16606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E16606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dc57e2a3f2so2344358b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622373; x=1795227173;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yk/3snzscfu7Vm9ifwH3CUsIk8OR4zOpQFjkwqXlhNw=;
        b=GCA5f+4k0dAOVPDE57BRKlkv4WKxgqWLEbtvBe91llK3c8hAdT70wqZ+SgelLYKYLU
         DJBOHCUwDI+4LnoZ7NEgkYnO2rvRpCKfqF1zhCFU2fluK1az0pD+a1dbQm7xZPfIAn/O
         DYbQcHHEgIXevEwMxBNkbG2uRpUG2dk9kEJLwCrxQ+qrvbocCZF6M5NMsukRqqzIiRJy
         XjRtGPQShutSrVfLzdzjZYpYxPr38djXNyIzakv/yHv2OH0buSGCVcsQlS/22NOWnRwc
         TCDoTm/GQSGsoTVgX4og4or+kOBmNNwV7lsYLeDUM3rkWESY5ycPf+SLPI8jWUKkDGbU
         4+xw==
X-Forwarded-Encrypted: i=1; AL+hErFPALouvqfGtef9qDRfrTf9utfJoX+R68BCNfaRJWFuXdNhgIkBzak391s7s5563/PctMI1mUDiTkaep1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lDKtcHAA9A95PggM/shzSVFwT//DwGokYzyTOZDeoSjBA9c0s
	0YT09t0XBOyxK3JEgUk+mKzbhgOdl2N+ZHW+isrDtb8YZn5fDR+fYxVEvrLgdYzSl/zWK9pohZi
	H8gwcChp6xuIgjnG1ZEBRIBSfAmufs2q6PbcCX047YyX/pxQfXScyn02O6KM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14d2:b0:4f9:a153:8446 with SMTP id
 5614622812f47-56e64cf4006mr3872138b6e.38.1794622373014; Fri, 13 Nov 2026
 18:12:53 -0800 (PST)
Date: Fri, 13 Nov 2026 18:12:52 -0800
In-Reply-To: <CA+SOfxcJCuTVCkz4s0dpN9SnvrhFRoeeSuQ5Ct_Q2_Wc0D-EkQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af7c3a4.c3c214cc.692fa.011d.GAE@google.com>
Subject: Re: [syzbot] [nvme?] KASAN: slab-use-after-free Read in nvmet_port_subsys_allow_link
From: syzbot <syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com>
To: izaacchong934@gmail.com
Cc: izaacchong934@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

> master
