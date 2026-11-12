Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491903;
	b=Sq2ssUquiyYEosRUkRhX/tiNBs3yVE0k8rh/45MyCeBxqmGk2CzDocG+Zs7ptCTtyNgV
	 gaHgm7Kmoolu+LATgg6C0tjU8f7J1LI5CKlIIc61Op+dMzBtRqTMi0lydyIikDh14VKmo
	 8Ba0TYHhDMxJ9PWFALZ8xB0t6Ti0zmTVn13CwcTphRV75VLWEY9ZYmfT4nOXdIGHk4xnz
	 kpBxBYvhWIzBhfKegxJijRQAQHGzYMRTlVfMnkaYZvOmeY2A1jr6w7hppleXiJbD3Vs7i
	 2lpMieQ8I5PikQ20z0fcj3t1p0UKMqSLTmuKD09/lI5Q0dEro4U/pXnXJKNoIXDvWsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491903;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=koBShxuECwa4MuNz2aTe3kw1fBo7B1Ydf3EYIIPkXLw=;
	b=mENJowmV2bzISwXu9LtR/PYIMf3LAsRBccqkN9dcI7XizipsrZIQtVHcEIHP6qWo8+zm
	 8JRkiBZ+9WsGKXKPmZe6p2Nk2q/twP6ST2VllTjYHzWilGPtA56OLr8Z5rKNpjbZUwpBy
	 dShdS3CMRv+OJrlcYef4ozBpsPBTMWzlRSiPMEHB/e/8obsiALzzvBTh171YgIyEzF/uN
	 0hulEzmJbuizxdx43Gvl0OveQ25rnaMRZ4cpIDU7dlwYc0nwlulEdsPvJrChYba+gUT+h
	 l2l4rRqzeHnXFMqgle0slyYxWZ4Bl0CstLI/OGGRRnjYAE8w5cLaq6uI93odPtR7Sxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjsmsYPe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035D160A260E;
	Thu, 12 Nov 2026 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjsmsYPe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281971F00A05;
	Thu, 12 Nov 2026 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794491902;
	bh=koBShxuECwa4MuNz2aTe3kw1fBo7B1Ydf3EYIIPkXLw=;
	h=Date:From:To:Cc:Subject;
	b=KjsmsYPe8owv7rERkxwVFCfVuUYpQcmt+zKe3a2bE56zPBSQQN/G9lwUOhxHo+EWH
	 BZ+qb3M5firUSxlJiaQ5HUm4FE/lGcwMpDmBaK0xdkxX1VB1LGptjVy1fB12wzMQWK
	 b8rowPGTyIHUjHZdB4KiFCPbDVvS3xBDwOY1g23rzcYx7NI0A6oXI7EtlP10iiK1ku
	 j0Xwz4WhLKF8me1Lt6n+YP/uDbCP+dtCz80lJjblqx2ef75AsHh1r+56ijFwrZWwVz
	 cYlD4vqxCd3S3CPnDSVST9XhLxJgCYh4/bsUh7w3HlT83H7C7yqvzBeBZLaqOjBS4M
	 Zmk2/nKacCz4g==
Date: Thu, 12 Nov 2026 13:58:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sean Young <sean@mess.org>
Subject: linux-next: manual merge of the v4l-dvb tree with the origin tree
Message-ID: <avXF-hdMaFjI2_gE@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wEfI88s8h40XiHcx"
Content-Disposition: inline


--wEfI88s8h40XiHcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/rc/rc-main.c

between commit:

  0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")

=66rom the origin tree and commit:

  8da461248793a ("media: rc: struct rc_map should have entries and capacity=
")

=66rom the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/media/rc/rc-main.c
index 4bf645ac8d7b5,e2e99ea635166..0000000000000
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@@ -8,7 -8,6 +8,6 @@@
  #include <media/rc-core.h>
  #include <linux/bsearch.h>
  #include <linux/spinlock.h>
- #include <linux/delay.h>
  #include <linux/input.h>
  #include <linux/leds.h>
  #include <linux/slab.h>
@@@ -114,8 -113,6 +113,6 @@@ struct rc_map *rc_map_get(const char *n
  			pr_err("Couldn't load IR keymap %s\n", name);
  			return NULL;
  		}
- 		msleep(20);	/* Give some time for IR to register */
-=20
  		map =3D seek_rc_map(name);
  	}
  #endif
@@@ -155,7 -152,7 +152,7 @@@ static struct rc_map_table empty[] =3D=20
  static struct rc_map_list empty_map =3D {
  	.map =3D {
  		.scan     =3D empty,
- 		.size     =3D ARRAY_SIZE(empty),
+ 		.entries  =3D ARRAY_SIZE(empty),
  		.rc_proto =3D RC_PROTO_UNKNOWN,	/* Legacy IR type */
  		.name     =3D RC_MAP_EMPTY,
  	}
@@@ -202,10 -199,11 +199,11 @@@ static int scancode_to_u64(const struc
   * @rc_map:	the rc_map to initialize
   * @map_name:	name to assign to the table
   * @rc_proto:	ir type to assign to the new table
-  * @size:	initial size of the table
+  * @size:	number of entries the table must be able to hold
   *
   * This routine will initialize the rc_map and will allocate
-  * memory to hold at least the specified number of elements.
+  * memory to hold at least @size entries; the capacity is rounded up
+  * to a power of two.
   *
   * return:	zero on success or a negative error code
   */
@@@ -213,15 -211,15 +211,15 @@@ static int ir_create_table(struct rc_de
  			   const char *map_name, u64 rc_proto, size_t size)
  {
  	struct rc_map_table *scan;
- 	unsigned int alloc;
+ 	unsigned int capacity;
  	char *name;
 =20
  	name =3D kstrdup(map_name, GFP_KERNEL);
  	if (!name)
  		return -ENOMEM;
 =20
 -	capacity =3D roundup_pow_of_two(size);
 -	scan =3D kmalloc_objs(struct rc_map_table, capacity, GFP_KERNEL);
 +	alloc =3D roundup_pow_of_two(size);
 +	scan =3D kmalloc_objs(struct rc_map_table, alloc);
  	if (!scan) {
  		kfree(name);
  		return -ENOMEM;
@@@ -231,12 -229,12 +229,12 @@@
  		rc_map->name =3D name;
  		rc_map->scan =3D scan;
  		rc_map->rc_proto =3D rc_proto;
- 		rc_map->len =3D 0;
- 		rc_map->size =3D alloc;
+ 		rc_map->entries =3D 0;
+ 		rc_map->capacity =3D capacity;
  	}
 =20
  	dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%zu bytes)\n=
",
- 		alloc, alloc * sizeof(struct rc_map_table));
+ 		capacity, capacity * sizeof(struct rc_map_table));
  	return 0;
  }
 =20
@@@ -256,8 -254,8 +254,8 @@@ static void ir_free_table(struct rc_ma
  		name =3D rc_map->name;
  		scan =3D rc_map->scan;
 =20
- 		rc_map->size =3D 0;
- 		rc_map->len =3D 0;
+ 		rc_map->capacity =3D 0;
+ 		rc_map->entries =3D 0;
  		rc_map->name =3D NULL;
  		rc_map->scan =3D NULL;
  	}
@@@ -280,37 -278,38 +278,38 @@@
  static int ir_resize_table(struct rc_dev *dev, struct rc_map *rc_map,
  			   gfp_t gfp_flags)
  {
- 	unsigned int newsize =3D rc_map->size;
+ 	unsigned int new_capacity =3D rc_map->capacity;
  	struct rc_map_table *newscan;
 =20
  	lockdep_assert_held(&rc_map->lock);
 =20
- 	if (rc_map->size =3D=3D rc_map->len) {
+ 	if (rc_map->capacity =3D=3D rc_map->entries) {
  		/* All entries in use -> grow keytable */
- 		if (newsize >=3D IR_TAB_MAX_ENTRIES)
+ 		if (new_capacity >=3D IR_TAB_MAX_ENTRIES)
  			return -ENOMEM;
 =20
- 		newsize *=3D 2;
+ 		new_capacity *=3D 2;
 =20
- 		dev_dbg(&dev->dev, "Growing table to %u entries\n", newsize);
+ 		dev_dbg(&dev->dev, "Growing table to %u entries\n", new_capacity);
  	}
 =20
- 	if (rc_map->len * 3 < rc_map->size && rc_map->size > IR_TAB_MIN_ENTRIES)=
 {
+ 	if (rc_map->entries * 3 < rc_map->capacity &&
+ 	    rc_map->capacity > IR_TAB_MIN_ENTRIES) {
  		/* Less than 1/3 of entries in use -> shrink keytable */
- 		newsize /=3D 2;
- 		dev_dbg(&dev->dev, "Shrinking table to %u entries\n", newsize);
+ 		new_capacity /=3D 2;
+ 		dev_dbg(&dev->dev, "Shrinking table to %u entries\n", new_capacity);
  	}
 =20
- 	if (newsize =3D=3D rc_map->size)
+ 	if (new_capacity =3D=3D rc_map->capacity)
  		return 0;
 =20
- 	newscan =3D krealloc_array(rc_map->scan, newsize,
+ 	newscan =3D krealloc_array(rc_map->scan, new_capacity,
  				 sizeof(struct rc_map_table), gfp_flags);
  	if (!newscan)
  		return -ENOMEM;
 =20
  	rc_map->scan =3D newscan;
- 	rc_map->size =3D newsize;
+ 	rc_map->capacity =3D new_capacity;
 =20
  	return 0;
  }
@@@ -342,9 -341,9 +341,9 @@@ static unsigned int ir_update_mapping(s
  	if (new_keycode =3D=3D KEY_RESERVED || new_keycode =3D=3D KEY_UNKNOWN) {
  		dev_dbg(&dev->dev, "#%d: Deleting scan 0x%04llx\n",
  			index, rc_map->scan[index].scancode);
- 		rc_map->len--;
+ 		rc_map->entries--;
  		memmove(&rc_map->scan[index], &rc_map->scan[index+ 1],
- 			(rc_map->len - index) * sizeof(struct rc_map_table));
+ 			(rc_map->entries - index) * sizeof(struct rc_map_table));
  	} else {
  		dev_dbg(&dev->dev, "#%d: %s scan 0x%04llx with key 0x%04x\n",
  			index,
@@@ -358,7 -357,7 +357,7 @@@
  		/* A previous mapping was updated... */
  		__clear_bit(old_keycode, dev->input_dev->keybit);
  		/* ... but another scancode might use the same keycode */
- 		for (i =3D 0; i < rc_map->len; i++) {
+ 		for (i =3D 0; i < rc_map->entries; i++) {
  			if (rc_map->scan[i].keycode =3D=3D old_keycode) {
  				__set_bit(old_keycode, dev->input_dev->keybit);
  				break;
@@@ -410,7 -409,7 +409,7 @@@ static unsigned int ir_establish_scanco
  	 * Binary search for an existing mapping for this ir command.
  	 */
  	lo =3D 0;
- 	hi =3D rc_map->len;
+ 	hi =3D rc_map->entries;
  	while (lo < hi) {
  		i =3D lo + (hi - lo) / 2;
  		if (rc_map->scan[i].scancode =3D=3D scancode)
@@@ -423,18 -422,18 +422,18 @@@
  	i =3D lo;
 =20
  	/* No previous mapping found, we might need to grow the table */
- 	if (rc_map->size =3D=3D rc_map->len) {
+ 	if (rc_map->capacity =3D=3D rc_map->entries) {
  		if (!resize || ir_resize_table(dev, rc_map, GFP_ATOMIC))
  			return UINT_MAX;
  	}
 =20
  	/* i is the proper index to insert our new keycode */
- 	if (i < rc_map->len)
+ 	if (i < rc_map->entries)
  		memmove(&rc_map->scan[i + 1], &rc_map->scan[i],
- 			(rc_map->len - i) * sizeof(struct rc_map_table));
+ 			(rc_map->entries - i) * sizeof(struct rc_map_table));
  	rc_map->scan[i].scancode =3D scancode;
  	rc_map->scan[i].keycode =3D KEY_RESERVED;
- 	rc_map->len++;
+ 	rc_map->entries++;
 =20
  	return i;
  }
@@@ -464,7 -463,7 +463,7 @@@ static int ir_setkeycode(struct input_d
 =20
  	if (ke->flags & INPUT_KEYMAP_BY_INDEX) {
  		index =3D ke->index;
- 		if (index >=3D rc_map->len) {
+ 		if (index >=3D rc_map->entries) {
  			retval =3D -EINVAL;
  			goto out;
  		}
@@@ -474,7 -473,7 +473,7 @@@
  			goto out;
 =20
  		index =3D ir_establish_scancode(rdev, rc_map, scancode, true);
- 		if (index >=3D rc_map->len) {
+ 		if (index >=3D rc_map->entries) {
  			retval =3D -ENOMEM;
  			goto out;
  		}
@@@ -503,15 -502,15 +502,15 @@@ static int ir_setkeytable(struct rc_de
  	int rc;
 =20
  	rc =3D ir_create_table(dev, rc_map, from->name, from->rc_proto,
- 			     from->size);
+ 			     from->entries);
  	if (rc)
  		return rc;
 =20
  	scoped_guard(spinlock_irqsave, &rc_map->lock) {
- 		for (i =3D 0; i < from->size; i++) {
+ 		for (i =3D 0; i < from->entries; i++) {
  			index =3D ir_establish_scancode(dev, rc_map,
  						      from->scan[i].scancode, false);
- 			if (index >=3D rc_map->len) {
+ 			if (index >=3D rc_map->entries) {
  				rc =3D -ENOMEM;
  				break;
  			}
@@@ -556,7 -555,7 +555,7 @@@ static unsigned int ir_lookup_by_scanco
 =20
  	lockdep_assert_held(&rc_map->lock);
 =20
- 	res =3D bsearch(&scancode, rc_map->scan, rc_map->len,
+ 	res =3D bsearch(&scancode, rc_map->scan, rc_map->entries,
  		      sizeof(struct rc_map_table), rc_map_cmp);
  	if (!res)
  		return -1U;
@@@ -596,7 -595,7 +595,7 @@@ static int ir_getkeycode(struct input_d
  		index =3D ir_lookup_by_scancode(rc_map, scancode);
  	}
 =20
- 	if (index < rc_map->len) {
+ 	if (index < rc_map->entries) {
  		entry =3D &rc_map->scan[index];
 =20
  		ke->index =3D index;
@@@ -644,7 -643,7 +643,7 @@@ u32 rc_g_keycode_from_table(struct rc_d
  	spin_lock_irqsave(&rc_map->lock, flags);
 =20
  	index =3D ir_lookup_by_scancode(rc_map, scancode);
- 	keycode =3D index < rc_map->len ?
+ 	keycode =3D index < rc_map->entries ?
  			rc_map->scan[index].keycode : KEY_RESERVED;
 =20
  	spin_unlock_irqrestore(&rc_map->lock, flags);
@@@ -1278,7 -1277,6 +1277,6 @@@ void ir_raw_load_modules(u64 *protocols
  			*protocols &=3D ~proto_names[i].type;
  			continue;
  		}
- 		msleep(20);
  		available =3D ir_raw_get_allowed_protocols();
  		if (!(*protocols & proto_names[i].type & ~available))
  			continue;
@@@ -1841,7 -1839,7 +1839,7 @@@ static int rc_prepare_rx_device(struct=20
  	rc_map =3D rc_map_get(dev->map_name);
  	if (!rc_map)
  		rc_map =3D rc_map_get(RC_MAP_EMPTY);
- 	if (!rc_map || !rc_map->scan || rc_map->size =3D=3D 0)
+ 	if (!rc_map || !rc_map->scan || rc_map->entries =3D=3D 0)
  		return -EINVAL;
 =20
  	rc =3D ir_setkeytable(dev, rc_map);
@@@ -2075,10 -2073,12 +2073,12 @@@ void rc_unregister_device(struct rc_de
  	if (dev->driver_type =3D=3D RC_DRIVER_IR_RAW)
  		ir_raw_event_unregister(dev);
 =20
- 	timer_delete_sync(&dev->timer_keyup);
- 	timer_delete_sync(&dev->timer_repeat);
+ 	if (dev->driver_type !=3D RC_DRIVER_IR_RAW_TX) {
+ 		timer_delete_sync(&dev->timer_keyup);
+ 		timer_delete_sync(&dev->timer_repeat);
 =20
- 	rc_free_rx_device(dev);
+ 		rc_free_rx_device(dev);
+ 	}
 =20
  	/*
  	 * lirc device should be freed with dev->registered =3D false, so

--wEfI88s8h40XiHcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr1xfkACgkQJNaLcl1U
h9Cpbwf/Rj9Zp51BFTH4I5TQ/NwjDG0K+bGSwoxQYJM+dPqHZG6pHug7KlbW3dI1
nUSxm/mCTbeAUlHWj6MKn5ojfsFcbcGF7EiUX29XDHe3YbVWYBv6xs55HZt0oSnh
QFTZkR52W2VCkXfV1hwxYGtOBdVYQZF3joOABq2ueXVGEy1CNDhR6mu2/BB1roPv
rVArXDBkpJVZK4eR5UATUkT42+VgbMAYP5F5JyEi81NlOncLBqdNO5aS3oIP3yYU
S6DkzHtREvY+BXYb76VC/KnE3dBwBW+qGR1CX0W1CuWwNwnS2e4HNs1iFod2ewFt
YOp+FiKdJwpkSi14JLhbhLWSA6xknA==
=UV8U
-----END PGP SIGNATURE-----

--wEfI88s8h40XiHcx--
