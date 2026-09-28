Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9052E34887B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617381; cv=pass; b=mOuhvAzRzqe3ERmKJQlhmpnIGWgOaywkXEMPEaTIW5zb9fZj/abS/wDGHOSfZ9ZRu27nI0FY6Qd7wCT6mHFgEhgtvb0weI3v/FkhumfsAPakiL8RmDh+i5j7JPuQdfnv57mqcr9ip5OXvcL6VWSGoqExdcCJ5fU7p+sxjxXMdJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617381; c=relaxed/simple;
	bh=tBMm4XuAu0hAMOVLllg1YwkUSfbdG6RXoepaWP9ckQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFiP3W5+4GjfscyByt2gp5cTjtmh0IEwQHpH7bRJoIqMWaIoLJ/+Br2+PfHZ0y2bEesufsbBLV5Eb5JJIUBnYDgKecICntPrG9s0NLhmqCG2K8JVA+F/6/U2mV9wc7Ow4G2HEQ7rx6tW1X72i5K9VGC8Tzz8THhYdqgZoCjH/vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BiydTQbP; arc=pass smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BiydTQbP"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91782a91a3aso2641036d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790617379; cv=none;
        d=google.com; s=arc-20260327;
        b=kJuE7xpJj10hF4GNaPCJOARtSW+rS66LKU8eDDXOhG8M2TnoQZWEmG1ezP+ekgb27V
         USSCTZKgMErEYHXXbKhZltzc8yfeBzb+9JXmpSO5hXriYvtcdFYVBylEnGhAxxMY138p
         akULxvn1JqjIdPQiXX6wKiq9WCrUu3XIiYvsVcPR4kmurhwuXRNM7MwNXWOXMV2YYIa5
         /HwUAgDoKhNCgVzC83EaUl8J4EAzER5HRe8wDY0T7fR8jovdTF9wb0UheHpUBVBsDe0W
         /66frMvvL6PG45ooWdjMpvvHTfpnunAVK80QTYVwsdc9GrjnbQfi4uHMhoiOkAIpAS7o
         cM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tBMm4XuAu0hAMOVLllg1YwkUSfbdG6RXoepaWP9ckQU=;
        fh=03GyLBFPTvrx+1IX489GAp64BkfSusc6EyiTsvFP4OU=;
        b=JFNcqgLhNMHvNU/7/7AMwm3KlFjuYiMVrFTOJ1HeiN/efgnSNlx4RflJpYBwuwW7X7
         2l+yLJo3bTBbyCVbfytHv9sU2V6bxH0IkNsvPipGTH7TcN0EuThxSwAD5xPZhLw7x4aD
         1XtvcRM4kYJNrfx1ShHQHo2XLIANUtyYKjulqSAdpXTuh6ycGQH01BX/IvmQ4jsB7ABC
         krFZa3YtorXspOQ7L+/pxkG/8dhRrt7awsAxLpgU/njTPcCqKmoPoiVJmN26gHgH2YF6
         B61RgcoyROP22/WGKMhOjSK4reFBo8fkwjx7MmEH0zSU4byCwylc9++iHFw0j57VC6F2
         ad+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617379; x=1791222179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBMm4XuAu0hAMOVLllg1YwkUSfbdG6RXoepaWP9ckQU=;
        b=BiydTQbPOeAdEz0U+bzGEnx/hSE1k6ewf4aMRoMI/2XZlXpRXLQclvnvxsqPdEQG/l
         h00rCmCFEAO7p6193k7t3r5BZ1/uO5vFJ5jRnNpc6euCKQQlYo9cFwDBrPle58+YUDCs
         RnFFe7BesbeSIbde3fl4loiPTl6ckapSOxjdF/Hm62pwMLuubtuuu0w/cUqYRZwH4RkB
         WAnf4uaBNuRDmMPQ4pP7M7m6qetqPjewMQqqtS5yhRLeQp0p+0YmTq8SVNnDv20jZdL7
         9rJ1N8jll8Y1mcwGYYgd4ydjInK4EFedd6RZAYWyRalLFLG9X01Vmslp3yvMjQCC+VDS
         /rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617379; x=1791222179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBMm4XuAu0hAMOVLllg1YwkUSfbdG6RXoepaWP9ckQU=;
        b=2Hudry1yUJVjfBYK4oejDIxZleh7TBZhYI0mVw/U7QHobGzbpN5DOhYln35tOfHcc1
         CxFZ0NPPRcAxX7IDNt+OR8qTLeZrKpFxF+kiWf3ugE6cqJSU+Z5icA4OH+Xf0OJJ869U
         rJLZOgr5uMZrqND4MKSYAMpciCS6tpgRnPmyno5U5FpPku+3Plvvbtc90Cuk8Ha1J2YP
         7qZnKEZ6gF5jNAvy5IpsA5TJpYrv7cCUfxmumPn4fH30ZzBpoeAQivWAMdNo8MWk+wAV
         a85up0nIUQ/4ZBJ6N7TR/pdC+Mg6HuNN2cTYOP6jC3fAhtUxYw98sOnA1Gyq5EfWgq5+
         /v3w==
X-Forwarded-Encrypted: i=1; AKwUvBxB5vcHwyu5fxxKbz1j7Ueehk9DoTvxZBtNdEyuhPYFyzXN3ZQRj22DA9oZUtSI8HNMPuCu2LyOEeftdW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVyYdHKpX3O06Ea4oVJF/u6hWJj7vM8rjB5v+pVeLz8s1fzOzn
	njNKhk7p16Q2BNNpB4s9+V6O27SFL99Rftpuu68fRN0HFdD/112MQ2Z7BtWuPfY7BH5UC0PX7N7
	BzqremtADUFSfUKte/0nkmcahP4rmaQ4JHamA+W4B
X-Gm-Gg: AYBFou1fVvcTknm6LPRABsPbBBrr7MzTuEVcdNpokOO0uP5ff8xI3yPkRiD0LjN7sni
	zFIkjD9OXD3G5xZI+fGVF+ymy7mkPoZBZ4uR/A1GNUmcu7TZLmy50mnsNQy5oX9tmoeJ/9x4rwc
	UE3uNJnpRwibnnCzoW6WLw0uacZJcEFghoL9HMi8esQOGLR16ynDRDv9NDzB8oGbEgQqbqO0dRp
	bO+0W8QMbTCNtRtNES6AndmQ/CMQu3zxH2hHjO7lb0OJEYtYYzbplhDHTCJzSQuuVfmPasWpbxA
	Pp0Gb5XFrLr2rftGwkRtCpF2rzARtmBdgc92v33/q2S4Xu0XLLLOv1tGsCRYEJDhQl/Eqv/GpuD
	Ght6zzReKUNzXcUaWAeBXdqutgIk4TSUnGBohVYmOyg==
X-Received: by 2002:a05:6214:21a9:b0:910:2f02:8c46 with SMTP id
 6a1803df08f44-9143222edc2mr218567806d6.14.1790617378675; Mon, 28 Sep 2026
 10:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a73d174.5aeeccc9.207e63.000c.GAE@google.com> <6ab29768.514bccd6.255447.001e.GAE@google.com>
 <6ab8c8cb.e548f532.1ca396.0037.GAE@google.com> <arjO9qbNdbvdi7ao@gmail.com>
In-Reply-To: <arjO9qbNdbvdi7ao@gmail.com>
From: Pimyn Girgis <pimyn@google.com>
Date: Mon, 28 Sep 2026 13:42:47 -0400
X-Gm-Features: AclHuK-qpUM45iPuLgTgCnMsb-qo1Qn6VReor2uYb0e5oZPZ4T_26Jl9lysMnJ4
Message-ID: <CAJWNTGzZ5=bBUzsAhaLLqNE0J3a_tj9BB0OvHhOaaWR8xn9S3g@mail.gmail.com>
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in rxrpc_destroy_all_connections
 (2)
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: syzbot <syzbot+89001660f14fb7684c83@syzkaller.appspotmail.com>, 
	davem@davemloft.net, dhowells@redhat.com, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 4:14=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> I just don't understand why it is failing... :(

Hi Jose,

For future reference, you can send the patch as a text file attachment
with the `#syz test:` command instead, which will avoid any parsing
issues.

--=20
=E2=B2=A0=E2=B2=9F=E2=B2=93=E2=B2=99=E2=B2=8F=E2=B2=9B =E2=B2=84=E2=B2=89=
=E2=B2=B1=E2=B2=A3=E2=B2=85=E2=B2=93=E2=B2=9F=E2=B2=A5 - Pimyn Girgis
Software Engineer
Kernel Dynamic Analysis
pimyn@google.com
