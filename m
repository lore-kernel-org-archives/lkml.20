Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7047537F002
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272080; cv=none; b=B+kZ5acHKb9QI1nI7H5GSvacqEjbPvtc4zNPeeNSf+oPpkCpw5jmRrEbv4ap2iM0tmSEWsOGqTvzghM0bZchXDmqqIIk9LXa+esKa3Zh5HpKhq/X53lbJOmfv29CJgDsg2PKIRIul8oIOQDAm2HKjG8ON6dprF4SBS+8dGvqU5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272080; c=relaxed/simple;
	bh=QFAgSgZ+lHhzp5hW79ZQMibWKh95PX7ZW4g2WWfSr0o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Gncg1iYkFpCzX8mrIAfNkizmpIRf4bv/Nj88Chgt8hYwTjtlMwN8Mc14msN5tPo5fi52mFL8yjmjpwbGuUZr7B/0+HJDOvE1I2ry4zRZP7XE/hF8j+0YEfFlTzMGb9kSE7yMxKMAG+Ej4VIef2SbziMUSag3iAgnff86cM9RAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-821de0b7baaso764074a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272075; x=1791876875;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QFAgSgZ+lHhzp5hW79ZQMibWKh95PX7ZW4g2WWfSr0o=;
        b=s0QRa57qFfJ3tTo0Sv3q4jpqqQtl82KSZyshPvpkdAB25W8Lbp2+n/v+MNAEJdNEZP
         x3UUNJ+zNaE7FDWt4dYeW9tgo8EVpnU9qg8sGhXybgwwSf1cAb5OSO+iB1HZNxdaePKg
         PAM158QfiRDE3j3QZMQt1dNFSPtl3TrGdlWz0MFKfXoymbcNEYGNmGuRvDobTjr67IK7
         zPOnUOjW2H0uMBFFGR2k+MyzzxRezSCtTD8l0TPnLwg7akEuQAfznOWvH0X4TnJ4tVDo
         k3Xi13qGNtiE5N4X6Sna2kQ8E4EwijNmpB2XRG3baPaViXK/JefyXEjmCiG9CneVqMPt
         vEiQ==
X-Gm-Message-State: AFuF++n4WGeTuzO5InBS3EyjpaeciW4Kiwg97NpH4qwxV106n5jKdwWM
	H72Iv78NdKExO4DQOpuUaFKDb7C+MWE28crwv4XRVnhpDVt2GqK2n6PRct84hdSwIkUUoU3obu1
	bT6L9aN+AI2mgvLj4sT2vm8kmgrZInbg5fB3tE8cw1FVUufe2UQdJ1GRas7E=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:159b:b0:4e9:429e:d9a7 with SMTP id
 5614622812f47-4fb415cdfe7mr536836b6e.49.1791272075268; Tue, 06 Oct 2026
 00:34:35 -0700 (PDT)
Date: Tue, 06 Oct 2026 00:34:35 -0700
In-Reply-To: <6ac332eb.598348e0.18b15.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac4a48b.ae2c267a.265a6c.000f.GAE@google.com>
Subject: Forwarded: WARNING in smsusb_term_device (2)
From: syzbot <syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: WARNING in smsusb_term_device (2)
Author: neganhat@gmail.com

#syz test: upstream 6addb4f38557
