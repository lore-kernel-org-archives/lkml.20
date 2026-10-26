Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038781;
	b=f+wWsp52CZs4uIFlFy9GJHDLVABfVk2ihr9GrHobu3duBNZFeYoRpwsW+o6Qj0Em9sss
	 px0TPlPEDL1xsfNdkwjFpujijZOEhcqfZt84082FRyAz7YuD81ZFbfrt5fx44W0syVF/B
	 21QRoM4u0QC38GGzN7mzWg9bS3ve/vRWhlhjf7WvmKtc6fdzRR7Lk6GrC46D9mv6fTvXj
	 4m6qnW6F9Hg5yYAdJdSO4+hQBEKpW10duDo60F1zPpaW/3LMDv1KFMB1VdxgNgSpz1mfl
	 egFKQJR4Q8alB11Iy6lUanWTf9UNRjCdjZyXmj6mxKirsD4RWX0o4/1JFsvzImQ4GEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:
	 MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=gcu/WhMdrdYK6iOAbE1Wy3Ff5zsW5qSQV/IfZkNxdhE=;
	b=y/c7nUHre1TjfGk+7lQ8gig81KX9m0CH/aP/4ESL+isAizekjBn80d5DKbBoZFP5lJmB
	 0noLWFxZNSmdBstxsiIvwgv8o1T4cwS5B4Q2n8Xx3R52pVic4+wAN40zMu8hZd7FwbOaB
	 Vtwz+LrLGajVj4MsG7+YIwipaa7MUnF8whVPx08/KNeQHKFYuHCXM6NBpjHvt3D3vQHr9
	 u+S/YTEcN0c31OYCkaGr4Gg51dw2AkVXkt6NNL1QWdKUfACtTZf/TzQdWC442nRwIufl2
	 3Xia6y/WUs16jc2u43WMsTB3uPFiFTpgVeBACMerL0n2n4Amnn4Q10MS/53+80vVYiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qgFDjUB4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0062606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0062606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qgFDjUB4
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so4682481a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793038779; cv=none;
        d=google.com; s=arc-20260327;
        b=T/PYLolQo6gnvCCNdJmfnMP77ltTS0OoqdEfzv+QAp0VcEpaTpWYAChhM3ajekIgUb
         PiDLLf/jvlmrbvDaeA8A4FLQCtv+0E6XzAl4TnQydzb34Vco5W7P09UVv3wT+c67eHpP
         0B4ehn2aA7XUsku+q0zPM/AY5RBvXIym0RGRjZ4N5awAW42NKR/6pemixyXdqULvXo/z
         oYpOI6xYmmM1qkiTPWQnLkLQVU07PAsoQUSKnwbAAe9kgSVyU78x6h9wm1sKPR4g9i8N
         2wNn27yacL9wWjXj6ZQHYeO70nq5DbN282VwBwy7AD5HnwnVSf733iuXc/QRTxsH6k1O
         59dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=gcu/WhMdrdYK6iOAbE1Wy3Ff5zsW5qSQV/IfZkNxdhE=;
        fh=gO9/vS+3gtnAcQ7P0i/NbH5QoUDJg7HAuIIbh6SrKgY=;
        b=TNw0qtzVsQNJG9v4nUWKGiyhHt+0+bOgPEgQQtFhR1isWqNCh4BjAWG9dc/tNW0/pt
         Bxy0ECMtF9AaSx6S9QcdN6GEOmfh/9m6+pJgY74IagoExAgK2H6TmyCcj6STLVAxvvnY
         L1MNgZvO6YRPwXmILiOQ8BURbxi2I7rWow69t4iZK+x8rb2wBFkaQbNj64r0X15+RKuE
         CRpUIzZnRXj5zzFNd4OxmNsOzDHdf7aua8VTpyzKqgDNpfGYRQL08OkA4NYFf4mIT6eo
         /kZRW96m9qGBvg2UEEZP8AOrYpPkMkAKXnjpsn1H9Ojuw5yaNOJrVVF4x6Y6UZm5sVbY
         bDcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793038779; x=1793643579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcu/WhMdrdYK6iOAbE1Wy3Ff5zsW5qSQV/IfZkNxdhE=;
        b=qgFDjUB4mGPeLZ/KoTsqfqUWk2pqjKgrnYLQhSeAjCBbb0cQhT30g2n6PTHHvpHBAN
         zDYayQmaZGOlRTxfgaW5KtytN62+bup8k4Xo09PVFmVNx2Dh60nJBbOLMtog0ong/2Hr
         77aIWTFUcUzCbqnjF5k+OvaDg+q4r2x1q7H6kT7Xr3UX7BRaQABpetXjO2tUOQPW40+o
         c8OmH6hdxBBAqFFzbAEhYLbBWCTgcus3V5/np0yAPE7kpKu5qhqH/UKHB04adI1FK9mT
         7X/6lP/Gq3wojjqqZprKppZsBRmC7UnH5E2rXpIKddfUSHKzNIiCC/phC0LAUqzFn+cS
         jIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038779; x=1793643579;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gcu/WhMdrdYK6iOAbE1Wy3Ff5zsW5qSQV/IfZkNxdhE=;
        b=QL6crDckbacJsbXglgBNKoJhFRucYUY3C0gohp9zbLTS5j5vXcwqux8a3Hz/LUe/9W
         zWZXyNbvVuAwofdJ6lSxWdBEYM3/aWqiA6gOVP6QF+COf1XtLqkr9/Ka+thMsViMPr9T
         ibwd3ZX094PPS8kzGcO3r08ZQjEjE7JF2lp9cQcmFARajEXeiVnGf4NKiKmjql5Ksbh1
         f5YZ7JCXaWk13sN6p2dPT3p3OPt9wqTy3EUNaOfzXt2VPJLQXE9qzNCKinA30nt0BN0H
         QAmrlFTF0VVgUBcA9ERqLEZQo+yz3kdbGxyhCUjoBCMRQn37qws4P0H0jzJnCzJjH3aT
         lbvA==
X-Gm-Message-State: AFq9FYJTXTsrgEPm17GBqfn2nAudmrrURXdCTBFKWz7W3Ky8H0uX7KT0
	sdOtuJ0g4BohP3Mok+FIf8rIB6q+A4d9dV2s7R7TtEXr0BquXRQG5iHrzxoATomlxgtgUEAoRH3
	y/B9Z8okAQVbGWYQ2Z1ZjJIikQ9BCn3lSYMi4
X-Gm-Gg: AYBFou3MhUR1QkxzAHHXMu3jhi03YNmP1mW578zZRAwGSa8HLEbDhDfsHYN/t4Vt+uf
	cipUcvObb4Fw5uO47hh4bnEe9t6iz3pOPz4DefGuS+oml3neNdDgmWM5wbg4U3whr4YEiM5PC34
	t3vXAqrWds7AigkxJe11t3m8PBy/bOaHud34onqVmEc4aHSdoLJSgB2Jm+oBuiCcXPSC/pnnBUE
	Re0ouUW7Lxa/pZMtXbJtTtubp2ING1QW/ALk89fH7CHeXL3iL3p4UpzSSM/UWbQWtkDQrJr2va4
	p+QSHAL7XXcL39x7S+WZ3eaGOF7fU7MaA/s97WKt2VF5rCIvWeEU5y3zmx6MTO++4q5AuN8882J
	4TEEtz2OEG3JjJwoHyeGhhXikczcDhLF783Ojytg8yGG3l+AF0QTAzGY=
X-Received: by 2002:a05:6402:42c2:b0:6ab:6e:a8e4 with SMTP id
 4fb4d7f45d1cf-6b4430043a8mr8107946a12.44.1793038779150; Mon, 26 Oct 2026
 11:19:39 -0700 (PDT)
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 11:19:38 -0700
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 11:19:38 -0700
From: Ivan <ivan.vin.ctf@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 11:19:38 -0700
X-Gm-Features: AclHuK-KbFYex8S3FFBCSiB4rgxThxEkN2l4h08kZuZwhKqNjkub1_ZiVvB8nzQ
Message-ID: <CA+hZKY+2wgMo79G72X28xg3yma6Va=CXeTX7_4=f8F3ZTDOODw@mail.gmail.com>
Subject: tty: vt: three wedge paths on 5.15 (paste_selection spin, vcs_open
 hang, do_update_region spin) - family report + backport request
To: linux-kernel@vger.kernel.org
Cc: jirislaby@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Three related reproducers on 5.15.216 (KASAN) covering the vt/console
family - one already has a fix upstream (not backported), two look
unreported. Together they make a 3-trigger-path family report:

1) soft lockup in tty_ioctl: tioclinux(TIOCL_PASTESEL) -> paste_selection()
   (drivers/tty/vt/selection.c:374). The throttled-tty loop does a bare
   schedule() without timeout; spurious wakeups spin it -> CPU soft lockup.
   The 2024 "[PATCH v2] tty: vt: selection: fix soft lockup in
   paste_selection()" series addresses exactly this and is NOT in
   5.15.216 -> backport request.

2) task hung in vcs_open (drivers/tty/vt/vc_screen.c:763): takes
   console_lock() and blocks in down() forever if the console semaphore is
   held by a wedged console path -> victims pile up (cascading hang,
   /dev/vcs* readers, printk, VT switch all freeze).

3) NEW: soft lockup in do_update_region (drivers/tty/vt/vt.c:664):
   writev() of binary blobs to /dev/tty1 (embedded VT sequences leave the
   VC in a bad state) -> insert_char -> do_update_region loops, CPU stuck
   22s+. Independent site: neither paste_selection nor console_lock.
   C reproducer available (syzkaller-generated + minimized).

Mechanistic link: one wedged paste_selection/console_lock holder freezes
every console consumer; the do_update_region spin is a third, independent
way to wedge the same console. On shared hosting any tenant with a tty can
trigger these -> cross-tenant DoS.

Patches/repros available on request; happy to test any fix on our fleet.

Thanks,
Ivan Vinichuk

Reported-by: Ivan Vinichuk <ivan.vin.ctf@gmail.com>
