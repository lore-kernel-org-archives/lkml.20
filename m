Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793097945;
	b=Ehcp7QQuwk8DLtT7bn/SBPbPBEIbR/d3xXrS4HHIQwj6X92oqO1lCHUHXRtZ5sPwD2Ts
	 ikzuGCGJOvRMJOH5K7DMUGBBq+Ri+izV6DthGCy/EEkS6GHispf6xHfHve5ZAfj6SZ3kw
	 N5trEERVuHkW2wvuPvxoXXYaDPAoS8QZ2brQRHCkvIYZujBe1CS3BXsdLeqa9uDY6m+ad
	 kt4alxcdjJj7jaPQu8J7XEDot8jFuxXDZvrwbSuCm/i0B30mLLTwVgV45dKKc1POdnHq6
	 sLWP/OznSRRWAgo7j581Q3AkHPt5QiYhKBrTox6G3mUbGiol1ADLSoXf4SNbVlOA4Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hTokF6f/74TTsrDj3bp7weKrYI5kvTRFYSNs6uOsOws=;
	b=OcM77mwFBnr5KhvjU41nXnjKTLDxM3wvrfd/SUmcArm2W7Yv++23mmedGtGtHo+qeSyA
	 XsfGjbCRJNZ3tlcQjyW8wSXLCtYxravzQU++f5wKJPVlfEyHpYJ8uU1JZ/FK3ZLDhSdEF
	 z1NxMSq9I+uRmsBRwj0yN5gm+0sIifL3/uFeVIow/eNbfboujfdtWd7B3sN8Xijzz/WbI
	 Y6xidWr9fhVi3UdQFmuRKUid+3+fdMMm54GLbNyILkAF+5FqFzlLBuoLimH6kDFGYocFG
	 fiBn/p27zL7oTKxh3O+XbEVmtPijtXkfAemRn1YQ+cSJdrAsRqcuOGmJFCJJiFeih4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sogkfs8Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.75
Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FDF606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65FDF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sogkfs8Y
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3ab32842bf0so25479231fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793097944; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/Q75R3mnXVN+G4+kdWZXcSibdg1wjoK2ZTdIaQ/4K1+FrioGrQKofiRo+c+52NgIY
         P9oY59xalfM1bqcudEbjWeB9/mIwTJX71eF+Q8Wjj9YyGae3Tzcx6FORZEnFRjViqhkL
         I2zO7yle2JkYj6ce/0n4ZP9JfDvz/DRczmCNgFxB+Pi81OHt2Fye/qx0ROAWHvWksTbl
         APc6ANWfw7uV3bD6a9UJXzxC8U51rIkzgxbdLF6jb8zMA+HI5G7HBIaErTGi2h9sjI3a
         xSZZi3p29dJx3dV1S7DJU9Qj7Vvf+WWL4HP9XxkRpwbWlX0IETaF1u5hMGeFAnZvTyuK
         OqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hTokF6f/74TTsrDj3bp7weKrYI5kvTRFYSNs6uOsOws=;
        fh=+sM3usnRii5TUWtTL9cEm5r9/YYKo8Xik8vE9Z5YyEs=;
        b=SJCErZ7tR65ylzFl2kRw1wzIO2+IvBhg83MvdIMqqEhjwHXZcp5BPo3Bp5Eu1/PQA+
         5wBcYcBY0lyZF6TbxoH51UcNiBfkHD3TcKWfjig3v2tv1k/WqZYd28AKpxYp6UpOcarZ
         6t7MPBj6Xb7ny8EoYibYu1ybFnEdrJxpPBXIcj9Mn2aAlWn/Te4hDaTnrJAvJ/uxmQIf
         ab0S/OME7sGIp5EVH3oeupSdfnxUe+vWrDVqwCbqxMmq/e3xKYPg1CBfSEZmVHpLKMS0
         9YSnAqjnxBSi000ikw2hJalxky89oOWQXxsBghcy7QCEJUSrhoohYdLU97kzs8ut+h1/
         O3vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793097944; x=1793702744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTokF6f/74TTsrDj3bp7weKrYI5kvTRFYSNs6uOsOws=;
        b=sogkfs8Yj7sLD1GRZUKprdjOlswEuPvl0xyZHwAG0iwY476oBzdktP8aRfeuCj+QEU
         h6aXCTXRsU3Yh7oF6mda1jsjjtbiEku1MBHqoMyLt+I1j7oj4hgW22Z/unEMrUU2n5ts
         5kc7EptSgzWes73Knoo0y4sPi7VLDrs01ZFtI79AlzO3Wv/67i4HT2J4S0cq44Y1J2TQ
         /cmyG57cyRboHEPJ+CLmKYX8mQ/yiLCQPpDFk/JAW2KqgqQ/+3gsM5dREycEm+1tb+wz
         /OWiFY3481x0kpqQmvg6ej5GanWyR8/4rpyAb+s62N/7MBRUrG9P95ZjCVaXHuUwYrSN
         TMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097944; x=1793702744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTokF6f/74TTsrDj3bp7weKrYI5kvTRFYSNs6uOsOws=;
        b=eouDjpwgHI8dmW2mRxNaMYkQ2ahQmqK9b8Icws8FKlvOWjNYtxXDSYmfxYNmVNkg4a
         FNOv/kqNyMHDn0pRlbAC13n2F7pxWv9tu31u07N1mBYQsTEwjY20aJIu79JZDKRA+/Zw
         ZhmELf+Qyy4GkuBsJtB2RMC/yS5gUDFtXWgSRDW/M+VxqGgWc/87mtpAO/bihRyRyh8E
         em6pgJEgHb9mqFhg00j588JnVj9Xi0NPk50NqBzZ5EVcaJ/+DxoS5mVpovmbIOIohhCQ
         WzlNCzgf7DoJCB8kMnhKBxeZMNcA9bjPpmVH6cQknqmCCbscK/5q2HQzDfANlT/zCuyO
         JMsg==
X-Forwarded-Encrypted: i=1; AKwUvBwbyO59O6DylQPGYYdPQYr87/2h5ersSLqmkILiz+G/zTfemJ7/BkFWqUF98eiJNdDC3mkPM5zdEl2rKOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRq7dyRIL41L3Cjy+HJxVvdGMoxUxwOfvWhyYbubMGrSshUR6N
	JkTU2jidvWmS+HheIU9pwnD6ZyNJwYO72qR/QtTRv3IAN37Cu+tLJ9VGB5Eu3NdhfjhZV0sQYjs
	SKJx/xLKbq7XeqOqLgTyTWuNAO3u60Dk=
X-Gm-Gg: AYBFou2LqSajVElW8brt0uxBn4BYP/1F48yNAlKEe6BXXFYpVIRIPuFR6QL/51tz+eP
	fLXi2TNxENVTD8u7IKy1W1avt8+E0Box1HC9SHAxJQvvYg7vmF3eOqDyoICLvUTo/D6O1So31PR
	s3/Fa65Fla/inKAtzVQ0JADVWGvvWgH17VzHU9rb3GeSN/ZdbbT1I7dy91L/qz8KtRSlzUbtgfr
	tDDitervnDpyRAyQfV/etuLsKfyhmXdaYacHS/ZUG8I1NOtaIqTurWDn4j3blJEqluiNsUbcAeS
	pEPXHJWIZR67qWvyjj+xCLmQdXzKB6A8d6Jyzb4urZEbQnS9cdOKQzm5tqxsTPMtrOMHgxW0CuP
	4gI15L1X03+6Qs58FoIJ5ZhNNpPDlKq5IaodB3Q==
X-Received: by 2002:a2e:8a88:0:b0:3a6:636b:63c5 with SMTP id
 38308e7fff4ca-3ac6fd3b986mr20717081fa.16.1793097943292; Tue, 27 Oct 2026
 03:45:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020034531.1420194-1-bsdhenrymartin@gmail.com> <20261021102614.GA3351287@shredder>
In-Reply-To: <20261021102614.GA3351287@shredder>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Tue, 27 Oct 2026 18:45:31 +0800
X-Gm-Features: AclHuK8Zgr31J_CCsucf-oYLGgEzAL6MqaaFwHvcjtoZy3YHWAsoUhYfxrWtFnQ
Message-ID: <CAEnQdOoQRuH8A=HnJqruN_kp5exzTwV7bK-LZUVo=LGuSMmgNA@mail.gmail.com>
Subject: Re: [PATCH net v2] vxlan: reject adding a remote to a nexthop fdb entry
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Petr Machata <petrm@nvidia.com>, 
	Ferruh Yigit <ferruh.yigit@amd.com>, Antoine Tenart <atenart@redhat.com>, 
	Ilya Maximets <i.maximets@ovn.org>, Seungwon Bae <qotmddnjs@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

No crash and no leak: the appended vxlan_rdst is freed with the
entry, and vxlan_xmit() follows the nexthop whenever f->nh is set.
What breaks is state consistency:

- vxlan_fdb_notify(), RTM_GETNEIGH dumps and the switchdev FDB
  programming all prefer the remote list over the nexthop, so user
  space is told traffic goes to the appended remote while the
  datapath follows the nexthop group.

- Once a stray remote is attached to an all-zeros nexthop entry,
  __vxlan_fdb_delete() destroys the whole entry when the matched
  remote is the only one on the list, so a dst-scoped "bridge fdb
  del ..." or "ip link set ... remote 0.0.0.0" tears down the
  nexthop entry, not just the stray remote.  Same class of
  inconsistency as commit 98fc57d16744.

Test cases added to fib_nexthops.sh in both ipv4_fdb_grp_fcnal() and
ipv6_fdb_grp_fcnal(), mirroring 98fc57d16744's style (rejected
append and rejected non-unicast replace on a nexthop entry).

A sashiko pass on v2 also caught that the rejection would leave
"bridge vni add" half-installed, so v4 is a 2-patch series: [1/2]
the fdb guard with the above message and tests, [2/2] a pre-install
rejection in vxlan_vni_add().  If the consequence description still
reads as net-next-only to you, I will re-send there once it reopens.

pw-bot: cr

Regards,
Henry

Ido Schimmel <idosch@nvidia.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8821=E6=97=
=A5=E5=91=A8=E4=B8=89 18:26=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Oct 20, 2026 at 11:45:31AM +0800, Henry Martin wrote:
> > FDB entries backed by a nexthop group must not carry a remote
> > destination list.  vxlan_fdb_update_existing() currently appends a
> > remote via vxlan_fdb_append() on an NLM_F_APPEND request with a
> > multicast or zero MAC even when the entry is backed by a nexthop,
> > breaking that invariant through three different callers:
> >
> > - "bridge fdb append" with a dst on a nexthop entry;
> > - "ip link set dev vx0 type vxlan remote <ip>" (vxlan_changelink());
> > - "bridge vni add/change ... group <mcast>" on a vnifilter device
> >   (vxlan_update_default_fdb_entry()).
> >
> > All three reach the append block with nhid =3D=3D 0 and a PERMANENT
> > state, so they pass the earlier nexthop checks.
> >
> > Reject the combination at the top of vxlan_fdb_update_existing(),
> > next to the existing nexthop guards, so a refused request has no
> > side effects: placing the check in the append block instead would
> > return -EOPNOTSUPP only after the entry state and flags have been
> > rewritten, skipping both the notification pass and the err_notify
> > rollback.
> >
> > Note the resulting behavior change for the two rtnetlink callers:
> > operations that previously succeeded while silently attaching an
> > unused remote to a nexthop entry now fail with extack
> > "Cannot add a remote to a nexthop fdb entry".
> >
> > This issue was discovered by Tencent CodeBuddy Security.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
>
> I agree that it doesn't make sense to append a remote to an FDB entry
> that points to a nexthop, but what are the consequences of allowing it?
> Does this patch fix a crash / memory leak? If so, the commit message
> should describe it. Otherwise, this looks like net-next material
> (currently closed).
>
> Also, please add a test case in fib_nexthops.sh, in a similar fashion to
> commit 98fc57d16744 ("vxlan: reject dynamic fdb entries that reference a
> nexthop id").
