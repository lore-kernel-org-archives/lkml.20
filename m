Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A224D0CDA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976477; cv=none; b=onPYMovhCi1PZaRS0UDu+dXeBR/ocwv2gqobWB+uPlYknCd4gcfo4MpL5EYEoPp0zEqkS9oj24ueZ1K8LVCZFpt0yS5v2QTeLTp4rIpfEX3F4C+PRmEPzmF2Hpum46eSJPFqfNnKV2b8jNjBz2HceGkqrG0HsTW4Hd55nhwvafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976477; c=relaxed/simple;
	bh=j6XmnRPFaTc417Vced2hGEhxNBqNTBJnc+n3ZEzyvK0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Umf+V/Kza8DAK1WAgw642WdHk40eemqkvhwgCo2i2507gfnhKL/YzJ+qMVqfgH4ec8zGPU/N0r14ysjAXo3ZY/CKLwNCnV4JSt60UF8PEtZwSEnq6BuX10uTZI9TZ1LK2ITvelkxFAeNP2WVFgOm2KP5032W2UHfxJVEWRDU2uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f4612a1a5cso7623100b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976473; x=1792581273;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j6XmnRPFaTc417Vced2hGEhxNBqNTBJnc+n3ZEzyvK0=;
        b=r+lVRTYvktwP9zALI/a0w9UzIVzfoHPhJXxGiGOFEWrFXxHW8KRtoSDfpgKm4DMGAL
         67YLh8PfFClGqSc7Uc2CP3lhu+8YlTJbAd1B5itSTYpAARYRgqiQasySfMUhfe+k9ETc
         BUXtcnoZSnGHzWsrOM5e3SZLOcQ+E0aKjL/+Z92UVIO5VS0h1ioEbFsKsfH0nKRBv4vl
         1UEiiOkX3EMQHXsNrkYZ+1bnw7iIRfpQJo36ZcP4P1Krk1F4oLQ0sVG3gw6CFsVAxjkl
         gzTVG2S1jP0NRWANWbge4QFpKB1yEbv2/jbhB+QZ7IP0N+BfkXDffrsf8mqZMHOcKADW
         8urA==
X-Gm-Message-State: AFq9FYLtauj4B2Ff6YeHwStmzLO8S/gaWXDgpbxP6RlJXSywbZX0lIme
	lnn8p0y4GA0fRRJTq77VhTTt0zedXsmIvllraYSvi0decwvuw82oP52PoHmsH8O8to451noNpkj
	zLHOApcpX2/UB2U/SCsDTf504pBcK2QPXUnGpuN+EmFUm2JC5rBVf8tsyB24=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6905:b0:4f5:1b84:8cd3 with SMTP id
 5614622812f47-50b60e559d8mr11599317b6e.24.1791976473100; Wed, 14 Oct 2026
 04:14:33 -0700 (PDT)
Date: Wed, 14 Oct 2026 04:14:33 -0700
In-Reply-To: <6acad256.a150a118.27e199.0030.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acf6419.5f317f00.247b6.0059.GAE@google.com>
Subject: Forwarded: inconsistent lock state in x25_kill_by_neigh (2)
From: syzbot <syzbot+300375dfd44665f063a6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: inconsistent lock state in x25_kill_by_neigh (2)
Author: neganhat@gmail.com

#syz test: upstream 24a19b953e2a
