Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6548CD7A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946605; cv=none; b=TSIW+cil9hos441NYv8y1vfUbamEBsnuno0LUbhyfCZP1is8V8NFXBWRPkVSng0ns8r0jyn6bW1ZKw/cFgsB8bLIorbUMq76I+q/1u2hNjEgI+dALcGfTklSmJECTF4fD5TcMWiBNYdmsTYgeWHed6Q943nKA4z+b9HQURk3EHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946605; c=relaxed/simple;
	bh=DrRJCNnlBCc5Zdz3q/62BVO3EKb/tzRwU5u5YBaJs9Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ydzol94KZyresFxkXDn3BbRiMwX6KyN/WmS6wnN8JQm+msnAsLxgXe54UO11cfUqsW6r5M+s59IIkP0tlH2z66ZXYRGmJ3Ng3Evdt6VWnB+zs3eNLZbjRKgRdNPRX1TSDskVhH/FClev2N0ncX6lEuv64aiV3PIZOO+46v3jVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab260600easo2710968b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946599; x=1791551399;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DrRJCNnlBCc5Zdz3q/62BVO3EKb/tzRwU5u5YBaJs9Y=;
        b=COv7cMq3Lrpumec9cPACVAF/kc+JOej766GbJSKCeu1EcrjRVdVu4GnwiJbfseXb6r
         ZQ8kAUWCZiaaQmnTtkRe6orbITsLjEW3xXyXOzOkwKLdIBw+v0qOaZ1/g9OCCBu+g8Af
         v1BuNFGYH+A4VvyvqSfCxbwjAX7Pz/E/+YbI9gB+6bBnp1PAPVowGuK+cv9E5UD8ieyD
         2fgzybtVU//hgP475ZiaZSlx6oE2oPwCypNON8hUBw89M1hE3VAC4IGbZrVNAUMun/Za
         xbF1Trnoy0akrPRFQKK6HQjzjVy2EvQ/cSP6W0AkkD0WqPCavb3XwVNcqahvpmYMqUxe
         Fx3w==
X-Gm-Message-State: AFuF++ncFZb5B23hwpBEDqFjVvV/F+vwFRb4WtsXt6VQccE6H+1A7WnS
	2cNAxfjEM1AvP7Oc/PRE0xidxZwFnR+sDkf5Ug4QUNXvibVB8K3Y5sZrE8hk2kVVpUQMOWEAXF7
	espBpFpCHiXCJ6tQ5deHCCU31sRW4wCOn5j36Pt825NIoH5sVQCvfvZqe5CA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1924:b0:4c9:f7ca:82b1 with SMTP id
 5614622812f47-4f30a7540bamr5323558b6e.33.1790946599563; Fri, 02 Oct 2026
 06:09:59 -0700 (PDT)
Date: Fri, 02 Oct 2026 06:09:59 -0700
In-Reply-To: <67710fe1.050a0220.226966.00be.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfad27.eb639fcc.2b981.000c.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] [usb-storage?] WARNING in usb_stor_msg_common/usb_submit_urb
From: syzbot <syzbot+73c662df6e55838c6ac6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [usb?] [usb-storage?] WARNING in usb_stor_msg_common/usb_submit_urb
Author: cloudflare.ddos21@gmail.com

#syz fix: usb-storage: ene_ub6250: fix race between scan work and probe
