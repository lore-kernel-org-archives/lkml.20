Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DEA2475CB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.196.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788932040; cv=none; b=uXlYDmzRsOKOb4Vm8zI2rKk/AThkR17VnnfBN/4/pnb+FEL2MBcBloRWavdTciCwYJpNM59NQkHTDmjLz9A3jiR0toGQS6icw7jksX/hyCgm9iC63sk6qdivmo79vw2RGW9/Ei0mnhMoUmQMvXf+X7PW433UD+1ffp1dlD8lGpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788932040; c=relaxed/simple;
	bh=Fm7fbqSVPqek4l5kO46jVd1tjrUVWIRYB522nhXE9sk=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=SR+gk0uQW+CKLsYYf8cC34tLjbBMG9BF+PkpKFv6K27ck0IDTic4px6AMvQT94C6QGIcOHkrjMeHZRxYEWtMPcJ+Ipb0W0KBqqPKQLDv9kyECM2SywQaPYS6Bor1TzTx/Y0rxZQP/suv+iwzB3hMrhqWjV6ZEtNxCD71jYctdwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b=QfGuFAP9; dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b=CWGRrnIC; arc=none smtp.client-ip=188.245.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b="QfGuFAP9";
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b="CWGRrnIC"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788932007; bh=Fm7fbqSVPqek4l5kO46jVd1
	tjrUVWIRYB522nhXE9sk=; b=QfGuFAP9IHjivEQyn9y1wD8AJJ6Ks2FHMZfSpZo1oA/eCxnkT+
	edRPgCH3YkFBxGT1x3LiEE342/Gooagq94Cw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788932007; bh=Fm7fbqSVPqek4l5kO46jVd1
	tjrUVWIRYB522nhXE9sk=; b=CWGRrnICFY9FAia8adXPeNZvX/+LyKPT7YECWYkJgyvzZ7gmXG
	5FdpIq+bFLbwr9mZnwq1r3p23LbRSSDs2+1hpTAlgTvl7oGUHZEQT7UcDow13Yewb3mzALrwLem
	rxPLHKkPMUiBf0AhCFjgUm+pQx9/7grY2o2N2CK2UO9/xp8tBiyR1tgzULHurCjfFIbbCW2O6BD
	NfcnOtWYzJAM/IKdUiQTcgzjIYHr88GTebZFARIfi4oNXeHVyw0dgVgSjDuOcwG+jgSVB2w+DAw
	vRhuX5k6nihMXD4I6zJG8Xln2TKk+6yGKjBAKyk0rk77LuU6b5ak+auVHNxE1QfGuNw==;
From: "Richard Weinberger" <richard@nod.at>
To: "Lucas Jeffrey" <luquijeffrey@gmail.com>, <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Lucas Jeffrey" <luquijeffrey@gmail.com>, 
	<syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
Subject: =?us-ascii?Q?AW:_[PATCH]_jffs:_initialize_inocache_to_NULL_when?=
	=?us-ascii?Q?_initializing_a_jffs2=5Finode=5Finfo?=
Message-ID: <mttnxeuy.56ba8b97-1e95-445b-b832-7ecca9937f48@nod.at>
In-Reply-To: <20260909023955.1642244-1-luquijeffrey@gmail.com>
References: <20260909023955.1642244-1-luquijeffrey@gmail.com>
Date: Wed, 9 Sep 2026 05:33:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Wed, Sep 9, 2026, 04:40 schrieb Lucas Jeffrey <luquijeffrey@gmail.com>:

> When a jffs2_inode_info is allocated via new_inode(), due to memory reuse =
it
> can retain stale values from its previous use.
>=20
> If the new jffs2_inode_info object allocated retains an old reference to a
> freed inocache, the function jffs2_new_inode may crash if either
> jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
> when calling iput() with the inode it will eventually attempt to free agai=
n
> the inocache.
>=20
> Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D3a8099322b09d8d073d1
> Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>

This was reported earlier but the reporter went silent.
https://lore.kernel.org/linux-mtd/849183271.921.1787173413104.JavaMail.zimbr=
a@nod.at/

Thanks,
//richard
