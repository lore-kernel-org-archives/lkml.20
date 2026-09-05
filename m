Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449C32D0EE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597819; cv=none; b=secw8q3LS3tdCF6srXmQNYQiwlXWmVwKTmUBJidBJ5/780S/ZqaVP7VzyOo9pzwViqtzhGo4DEGjdsoHMDpoLGu+/HmtbSSAw4b5cVKMMREmh3uT7vsMrYamSoae3i6or4C1BYwHCKdvCFo3G0nneo+guFLIdqRPLuCFaz/2aOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597819; c=relaxed/simple;
	bh=C4QJnvpWviAcO8fJI1TvitJRhstNdkSkmmP/2zmlvss=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuUshwJLd+dKoz+9/W82cBQyuNvrCKfg3mKnmMyyY2prIueZUGyMYzOxj022jruhH2nQKazi/wOJd/zauaTQPVrbIjoscL0td7jVAeDsKnKER/1kbY6MIq2UeNv9XbebYMfmfaxaSuaHe1HLBEoHF2joufmV5kvP7W85Z4KDNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T80EanUU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T80EanUU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so16439485e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788597816; x=1789202616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Akhb3CN3A6SrVcr0STO3cx8cdsASy5+A2+rjuvgdbv4=;
        b=T80EanUUUIWZ4ugRBS7SdvTQenfAi0diUS5BsU/dzNqbHqybGlR80UYvTbma5xVrno
         gjtz4GzeJXpJ00lZ4GywYs64gdJtVcBOMnMYiZ4SykQPk2fD3KIb3KoUhlDBmiYfG3uu
         IMo9Pt33LIIDJertj7zQFmo+bSlePfrI9re3gwnZi599Eh/wDpkiibQFyiBv6p0YxVyF
         n+oSPEkys3IK0NglAGUbXolf2PSUB8T5gpDcbDQnTNzLW22gKAjNjEM3fntoNF4L7nC+
         XUFwOev9b4XyOF7X/rkw7BROtoNLrptEKO1U7GcmFhpaiapwgkvqI5cD7JKAFYU5ytK8
         4y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788597816; x=1789202616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Akhb3CN3A6SrVcr0STO3cx8cdsASy5+A2+rjuvgdbv4=;
        b=Wh7Mm2jwvXG/vaUSAIeYAcDLrG9HPrpwj0XCvLIYWSjSZSHve7MINiH4nDMfel67M5
         CLcsXq7mwsSAH8TSL7wMKW83Sv3DJUbstqEAEA54eFeHoe6+afy02N6eC6jkH5jOPVHx
         bzwy1B+Mwcm5e4gkegbSHv0Ry/uc8IaxrujHbH3MN9b5045VXt+CziTTWrjMjC3gzs+W
         Hcw49BiajXAFayEphtWlXVvsiojo8OYiiGshoIJhAoLpx5wLLH5Nn0TmB+X1WlN+gVQu
         s5idt+rNN9E/ltCTjaiZ8x0mGPAURS/ebVbOxFfOjtXRxiKIGEIseB/vIq59LMi6FtMX
         xOHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTiwUlGE/tokh5eG7BeoYbKk53ONNENfSo/FEn1zf731D4L4qB3huIBrRvOQk+rpwvFQ1apg3IKSE4S5g=@vger.kernel.org
X-Gm-Message-State: AFuF++nKexoiqNeSaesCGaIIkpP/7H2Y01oQHJ/gZwOpXZjHhjKir1wN
	W/DZn9yJow9fFPR+XEaOp2Jv/gfW87I7E4xwvF32MhBFoAX12AWfOD4n
X-Gm-Gg: AYBFou0re/TNUBF3LebQjU1OtZOrlm6EgNIQIyyBXjuu7Y2EeYbn68od2woZdXVkDLk
	ZVvVaPawnEz7xykj2gD8aejejKBWkPi1qNZDryQPR3+Wt/qWJsP7/wpHTF2ic0YEmULYMvLYuqZ
	Dpmujxfg7FEdzA46xgWPm7yUzTO+cjAkzRIwDcSb62kAOlihRSnDSUq/whlt5Poc1oAsBqhqLcd
	e8tCSN6pH4lAWq8Wv+/0TbZosp5VMqtCBeVzaYngmKhToI1gEzF3iW+olTvY96cVPuFP1v5ypfd
	SYgeaPLDd73AxPHJF56SwJc5ScSn1F1aLOIEyUuVduVWrcqmziRDLYfYjWkTa5xX4wV1yyO7ksE
	9hnMBsVWANodKBDr8RZ9++yWGktKMZC/bSKcymu826Bm0quQAsfRkXsptkYHiMazyKOqokXQ+kD
	6GWTYrGGN/yWC0JPseGwlzIRf/IVUuARFGFxmcCzBf8m2ki7qLPikl2hZop4XirXedYxGuPw==
X-Received: by 2002:a05:600c:3507:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cf7fe6900mr192812715e9.3.1788597815955;
        Sat, 05 Sep 2026 01:43:35 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm93253635e9.3.2026.09.05.01.43.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 05 Sep 2026 01:43:35 -0700 (PDT)
Date: Sat, 5 Sep 2026 10:43:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, shuah@kernel.org,
 syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com,
 syzkaller@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
Message-ID: <20260905104331.6d4288df.michal.pecio@gmail.com>
In-Reply-To: <6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
References: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com>
	<6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 05 Sep 2026 01:12:27 -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    9d80aa4617b3 Add linux-next specific files for 20260903
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=10adf4f9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=bb4a32c282cc2ec7
> dashboard link: https://syzkaller.appspot.com/bug?extid=7300affe388249d66dfe
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=121c7215580000

Who or what is coming up with these ideas and even commenting it?

    // Iterate platform devices
    dir = opendir("/sys/bus/platform/devices/");

    while ((ent = readdir(dir)) != NULL) {

        // Set driver override
        snprintf(path, sizeof(path), "/sys/bus/platform/devices/%s/driver_override", ent->d_name);
        fd = open(path, O_WRONLY);

        // Bind to vhci_hcd
        fd = open("/sys/bus/platform/drivers/vhci_hcd/bind", O_WRONLY);
