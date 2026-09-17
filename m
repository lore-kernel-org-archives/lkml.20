Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC1E28BAB9;
	Thu, 17 Sep 2026 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659528; cv=none; b=qXgVGnYMgP5Hgs9OK5JGbAgNJUUznwGeRP3A5RckR2Iq3frZowkgCmFhDpPNP7eBdFIK/xFLtFjGoUXQTKQ7yjHDE0KMjF2bHgoZfAgDS6GAVJh1qHytGEiNWbSjP3KA8ZVQ6LL59Xvy5nbQSKaAwssu3/WQD+m180w6AN0qDOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659528; c=relaxed/simple;
	bh=0+ETC/SQiQDsuGPxUQtzMM9WtX+4Fn5g3v5BL2aB3OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KvOFKCPsj92wesZWYeAbtN35aGC//RkXA2X4XdcBLyHJIHRsnwXLMnOosGbHh4zWuSpStZ8Xt4549wJQN3g8GhRdCvwFzXnBoCgyJCUQDym9QWHyAHc5CSW5JT8jZCirk7/ZmUv9TEfb7CmMne9ik+GklxqH5upCOyKXXH3ABa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jv6+NfE3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jv6+NfE3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67D31F008A3;
	Thu, 17 Sep 2026 15:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789659520;
	bh=fPAmSlcW5N7C7Idgx6/XWyCPw21zadIulLcJz5dlKpU=;
	h=Date:From:To:Cc:Subject;
	b=Jv6+NfE3POuamKyNSgazDhW/i+w8kLLRqCCzJgwKZPacnYWPzfP9UfJhlj4zWLC/8
	 rNxqdVRXXstH+FjNBy66f4kQ/aQEG+sQCNtQjGsY3pAA68mYoeC7qrkwQzbrhiUQ1d
	 zIO3cH8k4Es7pZsE40CA01jFDr+P5JmTXg1NRdXzUgB7yYWHqh1TWycw6Ln1f0VM9P
	 2Pp6af9FINlB2DWpus94VZz9DKG5EgNcNJu51dHYfP157MZZ+ZwOaOGZXczxkFLKkU
	 4kKbgj+K/Vmmj01eAYlpFRxX7yQFURXybtIrD6BlPrB0o4rUywZewtQbLpOhwM4Xia
	 IjtXSgKaGAyAw==
Date: Thu, 17 Sep 2026 16:38:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>, ZHOU Jiaxiang <me@fxti.xyz>
Subject: linux-next: manual merge of the block tree with the scsi-fixes tree
Message-ID: <aqwJe4SYbqZ2Kt6m@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0sz8gFN6MxOXEQy1"
Content-Disposition: inline


--0sz8gFN6MxOXEQy1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/blk-zoned.c

between commit:

  7c431d61b69a3 ("scsi: block: Fix zones_cond out-of-bounds write on zone r=
eport")

=66rom the scsi-fixes tree and commit:

  670a7da6359f2 ("block: refactor disk_revalidate_zone_resources()")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Note that I'm very unconvinced by this merge.

diff --cc block/blk-zoned.c
index 475aa16bc41a5,ec510d66dfe2b..0000000000000
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@@ -2014,46 -2192,18 +2192,20 @@@ struct blk_revalidate_zone_args=20
  	sector_t	sector;
  };
 =20
- static int disk_revalidate_zone_resources(struct gendisk *disk,
- 				struct blk_revalidate_zone_args *args)
+ static int disk_init_revalidate_args(struct gendisk *disk,
+ 				     struct blk_revalidate_zone_args *args)
  {
- 	struct queue_limits *lim =3D &disk->queue->limits;
- 	unsigned long long nr_zones;
- 	unsigned int pool_size;
- 	int ret =3D 0;
-=20
  	args->disk =3D disk;
- 	nr_zones =3D DIV_ROUND_UP_ULL(get_capacity(disk), lim->chunk_sectors);
- 	if (nr_zones > UINT_MAX) {
- 		pr_warn("%s: Too many zones (%llu)\n", disk->disk_name, nr_zones);
+ 	args->nr_zones =3D disk_get_nr_zones(disk, args->capacity);
++	if (args->nr_zones > UINT_MAX)
 +		return -EINVAL;
- 	}
- 	args->nr_zones =3D nr_zones;
 =20
  	/* Cached zone conditions: 1 byte per zone */
- 	args->zones_cond =3D kzalloc(args->nr_zones, GFP_NOIO);
- 	if (!args->zones_cond)
+ 	args->zones_state =3D kzalloc(args->nr_zones, GFP_NOIO);
+ 	if (!args->zones_state)
  		return -ENOMEM;
 =20
- 	if (!disk_need_zone_resources(disk))
- 		return 0;
-=20
- 	/*
- 	 * If the device has no limit on the maximum number of open and active
- 	 * zones, use BLK_ZONE_WPLUG_DEFAULT_POOL_SIZE.
- 	 */
- 	pool_size =3D max(lim->max_open_zones, lim->max_active_zones);
- 	if (!pool_size)
- 		pool_size =3D
- 			min(BLK_ZONE_WPLUG_DEFAULT_POOL_SIZE, args->nr_zones);
-=20
- 	if (!disk->zone_wplugs_hash) {
- 		ret =3D disk_alloc_zone_resources(disk, pool_size);
- 		if (ret)
- 			kfree(args->zones_cond);
- 	}
-=20
- 	return ret;
+ 	return 0;
  }
 =20
  /*
@@@ -2131,48 -2307,54 +2309,47 @@@ unfreeze
  	return ret;
  }
 =20
- static int blk_revalidate_zone_cond(struct blk_zone *zone, unsigned int i=
dx,
+ static void disk_drop_zone_wplug(struct blk_zone_wplug *zwplug, void *dat=
a)
+ {
+ 	unsigned long flags;
+=20
+ 	spin_lock_irqsave(&zwplug->lock, flags);
+ 	disk_zone_wplug_abort(zwplug);
+ 	disk_mark_zone_wplug_dead(zwplug);
+ 	spin_unlock_irqrestore(&zwplug->lock, flags);
+ }
+=20
+ static int disk_revalidate_capacity(struct gendisk *disk,
  				    struct blk_revalidate_zone_args *args)
  {
- 	enum blk_zone_cond cond =3D zone->cond;
 -	struct queue_limits *lim =3D &disk->queue->limits;
 -	sector_t zone_sectors =3D lim->chunk_sectors;
+ 	unsigned int nr_zones;
+ 	int ret =3D -ENODEV;
 =20
- 	if (idx >=3D args->nr_zones) {
- 		pr_warn("%s: Zone report index %u exceeds zone count %u\n",
- 			args->disk->disk_name, idx, args->nr_zones);
- 		return -EINVAL;
 -	/* Checks that the device driver indicated a valid zone size. */
 -	if (!zone_sectors || !is_power_of_2(zone_sectors)) {
 -		pr_warn("%s: Invalid non power of two zone size (%llu)\n",
 -			disk->disk_name, zone_sectors);
 -		goto drop_all_zwplugs;
 -	}
 -
+ 	args->capacity =3D get_capacity(disk);
+ 	nr_zones =3D disk_get_nr_zones(disk, args->capacity);
+ 	if (!args->capacity || !nr_zones)
+ 		goto drop_all_zwplugs;
++	if (args->capacity >=3D args->nr_zones)
++		goto drop_all_zwplugs;
+=20
+ 	/*
+ 	 * Check if the capacity has changed. If it did, assume that the device
+ 	 * was reformatted and that all sequential zones are now empty. So drop
+ 	 * all zone write plug.
+ 	 */
+ 	if (disk->nr_zones && disk->nr_zones !=3D nr_zones) {
+ 		pr_warn("%s: Number of zones changed (%u -> %u)\n",
+ 			disk->disk_name, disk->nr_zones, nr_zones);
+ 		ret =3D 0;
+ 		goto drop_all_zwplugs;
  	}
 =20
- 	/* Check that the zone condition is consistent with the zone type. */
- 	switch (cond) {
- 	case BLK_ZONE_COND_NOT_WP:
- 		if (zone->type !=3D BLK_ZONE_TYPE_CONVENTIONAL)
- 			goto invalid_condition;
- 		break;
- 	case BLK_ZONE_COND_IMP_OPEN:
- 	case BLK_ZONE_COND_EXP_OPEN:
- 	case BLK_ZONE_COND_CLOSED:
- 	case BLK_ZONE_COND_EMPTY:
- 	case BLK_ZONE_COND_FULL:
- 	case BLK_ZONE_COND_OFFLINE:
- 	case BLK_ZONE_COND_READONLY:
- 		if (zone->type !=3D BLK_ZONE_TYPE_SEQWRITE_REQ)
- 			goto invalid_condition;
- 		break;
- 	default:
- 		pr_warn("%s: Invalid zone condition 0x%X\n",
- 			args->disk->disk_name, cond);
- 		return -ENODEV;
- 	}
-=20
- 	blk_zone_set_cond(args->zones_cond, idx, cond);
-=20
  	return 0;
 =20
- invalid_condition:
- 	pr_warn("%s: Invalid zone condition 0x%x for type 0x%x\n",
- 		args->disk->disk_name, cond, zone->type);
+ drop_all_zwplugs:
+ 	disk_for_all_zone_wplugs(disk, disk_drop_zone_wplug, NULL);
 =20
- 	return -ENODEV;
+ 	return ret;
  }
 =20
  static int blk_revalidate_conv_zone(struct blk_zone *zone, unsigned int i=
dx,

--0sz8gFN6MxOXEQy1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsCXsACgkQJNaLcl1U
h9BNKgf/WEpUjE5HjrhOXr1nSNjqVV9bINvNUVS9APOu2J1DRhHawYfWi9b8EeEP
jpQEFZhtgYxpWWYqWN+Sc7DTIu0homsCnyCjDkdx2JDadArTKi647AbEdcFZElcn
qO2ttzgBAAKb9SsbkLwDZ34GSJUvNLfNiIv3Wjh9ai+Qhi4yvHSo6S06oLo/wXh2
4plEUZaAjR++YQKz1IBImXtSTmcv67zscb+hXv5wFxs5jspak2gluXSi3zvCn80h
zCjelgtJSarfBaxP2OvVlvoUtlGSUb0U0teAgq1+VRQv+3F/RUgSmdTwk2pRAn4s
PLn9qDRP7YwKOwvgAAXuDuYi6YMZIA==
=UhE+
-----END PGP SIGNATURE-----

--0sz8gFN6MxOXEQy1--
