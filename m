Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784095;
	b=xIyEPAymOClBYXpye9SMsXnfU7rIL0tp48x+imLupw49qScvD6bK1xDCcAOG5/GTzSLs
	 sAjV6Oc+/ff0ho1Q0OPuLjn6Y2gvga3EaxtCblfPYfQFdSrpw6YLDMxqfGgKwFniniet1
	 vudNABdG038yVklzwpx1NsXt7i6UtZmbMwUG53nNnhsLiIh2feP6rSfVPxfzHRzLRA+Tj
	 qMSh5Q8k+QJduCE0CjHHCiAsb0sCNm7NEcCC8Pv/LnBx6R8Z6qVG63SHECnzqfrgF4G/g
	 9TA+ZqeKqOXkVh6H9JrI6+A/f6h89wTHiFfQJLLeqOtJkN2IgIbSeOtwXVncKZVprGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BnaqbrZYBPVpjbjm6kaz+k24LiVJFPqV80JgE+r/5Z4=;
	b=FAOrni2o/dL+gmPwT4DCbkC/X8oVhSQdIDd1nO3dWpH4TEdCbMhIb96QOtUW6eg12SG1
	 PINsbpI1XfayoV7rP89Ka2j2D/6Wmg7iubAklyvf3/AczgyAJQzqkR/ZvrneT65QGOjOb
	 zElplJqHobXXmQeoTyhLH6VNUmpDXaAQtGP/Z/De9thJtvAfpgUl9y72OC8kC83q/4Yb1
	 t2MbEHt0tMtqxuArMWG4wgJQe5oz//4O8FslGxaUbeGmuFnAfX0ds5i8FPcLBXL0UJcRk
	 /BsE/Cuv1qklzrYqecIt5RPZwMLq5y1BgHOuxY+F1JNmwPRLrjht+alPrymGkZEVtUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqtaw1X7;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C68606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C68606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqtaw1X7
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15943c9c005so1356709c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784094; x=1794388894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnaqbrZYBPVpjbjm6kaz+k24LiVJFPqV80JgE+r/5Z4=;
        b=pqtaw1X7H5Oql/mVKQz2c7B0POyLbeIwXZcI80h2TL4p7O4wp4xn6pZ3g8H6ubOVgp
         ghvqhAzAPkrGdKBLiako1QXMB8yuumv2pqIQ8QXRgfeCzFeifPDCGgdiEhaEJdtJVkal
         PKpwo6js8ngZZa5AafIiXnwgsjBSDFr4+hEvM3HyrG6pUAHkLCeslIyrkYiRvoLXbKKN
         4lgR9O875zYcyLyNubWOWOPW16PXdVAk64KpjkjQA+RWFSdIOBP8J5GImbGS7l3L7yCL
         14a2yk2MUYU7hFYK3EnC3rtv7EqLrcqS6hia0VbpyFNSARzMFzO/goWpedfKoMRwW96g
         /cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784094; x=1794388894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnaqbrZYBPVpjbjm6kaz+k24LiVJFPqV80JgE+r/5Z4=;
        b=FQAD6/xFJ2Ki0wL2h+4hrjd8tGjV29bhNR8hS6Ufa2FjDmfz0S7J/ZzR94V6nx8GzN
         imo8wboHdFPFhB1gwsPzMVJChFV9gSOjo1zI2nHcvJhkeCuxypwSpm6W5IozwuriU1US
         oygvmZSLP+jl0Ix/SRd7ISlBWLXbMj1UIbCKA5dVB8d+aIuyN9+YwMAZWDTPYbFt2pho
         QkKlEdPUFzZaKVsscuEPMf2R4APi7yufDnfjnY4mUqm2OyyEW2GxtLnEGOsX2fv5E9nI
         d5YBEV9u8ntlFn0ilVtnKKE3X6rsd2wQi955v0DWExCgf1ihZzhWa/Cdqu3Rhjf0DJF1
         YS2A==
X-Forwarded-Encrypted: i=1; AKwUvBwv11d/0ttnzAaN0JdCSIOEu5IalX1bNYFWSZC7VWU/QKMpRZd2cQQCRHCFjxBnYOAX6oE3Q5AY47x+UH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p+RbnJnZixBooOSTNtZNz06TC6ldrPludzd9liTDuIz5bhNg5
	z5rutL3wRYX6qrRt4iaXiKcZ4hsESlcgrgt2/Jy+3GshIL8TSUpM/1if
X-Gm-Gg: AYBFou0zHaDQmQHy3fPZz88PbwB4sPY+i3+h0o9IKY57tF4E4IR+ctSpZ7K/c4klctL
	moaVtT7DAozf4nQ0f52emiuNFkciEcE2811EvKAIekdsV6R/Fk9+Ohm9MSfNZUwU6zO0faARN06
	JKW/Rva4SXWP61m4VjRIsUdqIPaTHR8coYWXLV9RfJQWMMz/ye/9VUFlW2W8aXF+F6AxSvuDICC
	eVDoM8ImWES2Ux+8wjOhrknUOkfEMgNohDHhq/JdRX63ZC2GzIFHjWa+MTPaY8jGl31Pap3Wb7a
	rMSKI4QZ2DY6IYmlX8OD+pfGLcTkHls9Ad2G/1MpRariYYkPyiRSnY71lVVJWqkHeAHyT+nauB8
	HmwXkmEp5FnHs/BLKh+Sd+QKndYkpmJz8NvmMrLXTYsjwjPRbqSGcDSm2J492LuyuOHpaAXm/jz
	65b3zcMAvmP+xDJVL/eirFFyQUcVGVs+IFrPKDfVaAvLDfa3w1Svaht1DIQW8OohCLth7EK/AFS
	VOJwKEgXyHCqHUo1e/rF8V4ewiTPZkfUxLPeCH9BWtALxwFkUZuqcP1X4JkFnvOv1HAlj2pZVtu
	yFk6Mv4ku7YCE3y6gszXRBpV8J8rBpa0KlpvoCnowrKqx+TvJGa1Ajzcjhe1elK06GlkYaBE41Y
	gUworoPfRiSb5YuhRTI79KqYIJHGL7LQt8B23i2bosg9D5eQhgFq9/DSoKbg/g4yAxd6HEy5rSA
	==
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr20798515c88.8.1793784093531;
        Wed, 04 Nov 2026 01:21:33 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b87c4asm6058628c88.3.2026.11.04.01.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:21:32 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Florian Westphal <fw@strlen.de>,
	Mat Martineau <martineau@kernel.org>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net v5 0/2] genetlink: fix joining multicast groups no family owns
Date: Wed,  4 Nov 2026 09:21:23 +0000
Message-Id: <20261104092125.211537-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

genl_bind() checks the GENL_MCAST_CAP_* flags of a group, but the
membership bit is set later, after the lock is dropped. A socket can end
up a member of a group whose flags were never checked for it: when it
joins a group ID that no family owns, or when the family of the group is
unregistered between the check and the point where the bit is set.

Patch 1 rejects joins to group IDs that no family owns: setsockopt()
returns -ENOENT, and a bind() mask skips them and joins the other groups.
Patch 2 counts,
per group, how many times its members were cleared, which genetlink does
when a family is unregistered. If the count changed after the check, the
group is checked again against its current owner, after the bind
callback is undone if that owner is the one it reached. The core cannot
always tell, see patch 2.

Tested as an unprivileged user, with an msleep() added after the bind
callback in netlink_setsockopt() and netlink_bind(), and a test family
that registers again with GENL_MCAST_CAP_NET_ADMIN:

                                         patch 1 only   v5
  setsockopt:
  unregister in the window,
  register later                         member         not member
  unregister and register in the window  member         not member
  another family unregistered
  (must still join)                      member         member
  bind():
  unregister and register in the window  member         not member

With the msleep() before the bind callback instead, and a test family
that registers again without the flag, the family is bound once, and not
twice as with v3:

                                         v3             v5
  binds while a member, setsockopt/bind  2              1
  binds once the socket is closed        1              0

The test family counts its bind and unbind callbacks: they stay
balanced in all these cases. If the family is replaced just after the
bind callback returned, and before the second read, with an msleep()
there, it gets one unbind too many. The socket is still rejected or
checked against the new family. Normal joins and rtnetlink bind() show
no change.

The test from v1 (join all free IDs, then load gtp and drop_monitor)
gives the same result as before.

bind() with a mask, as an unprivileged user and as root:

                                         v4             v5
  an owned group and free IDs            -ENOENT        ok, owned group
  all IDs, as root                       -ENOENT        ok, owned groups
  only free IDs                          -ENOENT        ok, no group
  a group the user may not join          -ENOENT        -EPERM, no group

With a test module that releases its kernel socket while a socket joins,
v4 gets a NULL pointer dereference in netlink_setsockopt(), and v5 returns
-ENOENT, with one unbind for the one bind. I did not test this with a real
nfnetlink rollback.

I used an LLM to help write and review the code, the tests and the
commit messages of this series. I checked and tested every change
myself.

Changes in v5:
- Patch 1: a bind() mask skips the IDs no family owns, instead of failing
  as a whole, so that such a mask keeps working (Jacob Keller, netdev
  Sashiko). This changes the patch, so I dropped the Reviewed-by tags.
- Patch 2: return -ENOENT if the last kernel socket of the table was
  released and the counts are gone, which was a NULL pointer dereference,
  and call ->netlink_unbind() if ->netlink_bind() already ran (Sashiko).
- Not changed, from the netdev Sashiko review of v4: the counts of a table
  whose group count is reduced, and NETLINK_USERSOCK having no counts.
  Nothing in the tree reduces the group count, or uses the helpers with
  those counts on NETLINK_USERSOCK.

Changes in v4:
- Patch 2: read the count after ->netlink_bind() too, and call
  ->netlink_unbind() before checking again if the count had already
  changed: ->netlink_bind() can have reached the new owner, which was
  then bound twice (netdev Sashiko). The commit message says what the
  core still cannot tell.
- Patch 1: no change. It does not close the window on its own, patch 2
  does, and it keeps its tags (netdev Sashiko asked about the order).
- The deadlock netdev Sashiko found on the insert failure path of
  netlink_bind() exists without this series, it has its own patch:
  https://lore.kernel.org/netdev/20261102120929.4077030-1-anilkaushikwireless@gmail.com/

Changes in v3:
- Patch 2: check the group again in af_netlink.c instead of clearing
  the members when a family registers. This also covers the case where
  the family is unregistered and another one registers, both in the
  window, does not walk the sockets on every registration, and does not
  touch the members of a group another family still owns (Sashiko).
- Fixes: tag of both patches: the race exists since genl_bind() first
  checked a capability, in 4d54cc32112d (Sashiko).

Changes in v2:
- New patch 2 (Sashiko).
- Patch 1: no change, added Reviewed-by tags.

v4: https://lore.kernel.org/netdev/20261102155819.4100930-1-anilkaushikwireless@gmail.com/
v3: https://lore.kernel.org/netdev/20261101101347.3910654-1-anilkaushikwireless@gmail.com/
v2: https://lore.kernel.org/netdev/20261031054632.3697295-1-anilkaushikwireless@gmail.com/
v1: https://lore.kernel.org/netdev/20261029062214.3407223-1-anilkaushikwireless@gmail.com/

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  netlink: Check a group again if it was released while joining it

 net/netlink/af_netlink.c | 116 ++++++++++++++++++++++++++++++++++++++-
 net/netlink/af_netlink.h |   1 +
 net/netlink/genetlink.c  |   3 +-
 3 files changed, 118 insertions(+), 2 deletions(-)

-- 
2.25.1

