Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328509;
	b=5OCq1eVKphBx0/IvKAEbp1UiNKjxhd0URJ/j1LJh4rMS6Lcfd/gVErXXaoD3S4TJt0Cf
	 HLLs1aTh+bkZNeZ2nzN+bGouTQrji2InKXvk1Ne2+UdYrQLJyxe6Obl9Uj8S8PrvATSL7
	 h3MYz2c8UeFOLgehuquga1iLuw4pZBKvQloIUwa5rjG2H3vm8MyRwNJtdapG+QW8KyhvY
	 4JoEdIbKzUl0UZatF4nAQjj5eSJr7hL0rNSfjkL2ZQUei00+apmxfJbPBLF6E23agnaAT
	 TeTxp5MnVYNw2+AarE5GDMWbtjPDBlphD4pWRhTzigTsi4RNp0XDQEqdpfUK/fXLwXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328509;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=BEuKiUZj+lXfiUgL89dhzuxtSd29o7YqwXTcv8RBfHs=;
	b=J55o1fDzVrLxCcRfqP+PeEVcy0pQqSnlBbcpHvytUpwzgnMt6YC6ibIzRkr968AC79Oe
	 GvXPIBWmyOVpUFWRgXk45uO9GajRqRn9RNp3vE2GixgUijXNaBlbUUl6dP5X7LkNXPBwF
	 uSgDAf8qSmAKEFVqGKuZlgOkyKMVhkoTbUKo/Tv1IALgYX3boFAG3gqvLLwrkxjbSa3xP
	 s/Xa5jJaeHluRWBWqFErjIz6s2P5s5nAnVlqhFCgWRgt15oeZ/Up+nQjUxqMPc+vQCAcW
	 0REZrVuP7caMKGzX9w/ML+o9pz746tK/hXkeG9w1Y03cGD0g+Z+aUMT5GtUHBff63/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0rMHH1J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E940606A228;
	Tue, 10 Nov 2026 16:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0rMHH1J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC331F008A5;
	Tue, 10 Nov 2026 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794328508;
	bh=BEuKiUZj+lXfiUgL89dhzuxtSd29o7YqwXTcv8RBfHs=;
	h=Date:From:To:Cc:Subject;
	b=O0rMHH1Jg55M0NzjpnFBytWbI7Y2P213XYQFgo1WHKH+DCZ470PQ0FVhMu4Qlg3sS
	 bUp3y+brhOjSWIEQo5gg3xOGuGOus6sA6OjVjuji7RCXNt9IJEZB2XVZfWyrsPTyjR
	 Ep6o3tJtp/NqE4bHZsFWQF94d+zWvtbnkWiZzRfRY3YWyHN2jis8Bc2sR4bwfmMvga
	 QAwIq12yKMyEZZgQWTbZGGEtLp06myyndBFvBcv1cN+ImHeM13C8aMsd6ohvZqaY0D
	 krMWMWcXWLyB1ap6aHgQWtKkYdHnq4oXYIt9ronJW/Wk78oIADL+A3QJrNcTO6Qe0d
	 tMUEc6yhMilfA==
Date: Tue, 10 Nov 2026 16:35:04 +0000
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Qu Wenruo <wqu@suse.com>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes tree
Message-ID: <avNHuLlRQRBIU7NO@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="ttCmLTsHNpqhr+Jt"
Content-Disposition: inline


--ttCmLTsHNpqhr+Jt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/volumes.c

between commit:

  edfdccad42b67 ("btrfs: reject existing chunks that don't match")

=66rom the btrfs-fixes tree and commits:

  a4b66b23143d2 ("btrfs: reject existing chunks that don't match")
  987244ac4dbee ("btrfs: convert volumes.c and block-group.c to use map->st=
ripe_len")

=66rom the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/btrfs/volumes.c
index b4869ee8c3903,3d4ef6725de0e..0000000000000
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@@ -499,8 -499,10 +499,10 @@@ btrfs_get_bdev_and_sb(const char *devic
  	if (flush)
  		sync_blockdev(bdev);
  	if (holder) {
- 		ret =3D set_blocksize(*bdev_file, BTRFS_BDEV_BLOCKSIZE);
+ 		ret =3D bdev_validate_blocksize(bdev, BTRFS_BDEV_BLOCKSIZE);
  		if (ret) {
+ 			btrfs_err(NULL, "device %s doesn't support blocksize %u",
+ 				  device_path, BTRFS_BDEV_BLOCKSIZE);
  			fs_bdev_file_release(*bdev_file, holder);
  			goto error;
  		}
@@@ -1468,9 -1470,7 +1470,7 @@@ static bool btrfs_skip_registration(str
  }
 =20
  /*
-  * Look for a btrfs signature on a device. This may be called out of the =
mount path
-  * and we are not allowed to call set_blocksize during the scan. The supe=
rblock
-  * is read via pagecache.
+  * Look for a btrfs signature on a device. The superblock is read via pag=
ecache.
   *
   * With @mount_arg_dev it's a scan during mount time that will always reg=
ister
   * the device or return an error. Multi-device and seeding devices are re=
gistered
@@@ -2919,13 -2919,13 +2919,13 @@@ next_slot
  }
 =20
  /*
-  * Open @path for @sb with freezing denied before the holder claim is pub=
lished,
+  * Open @path for @fs_info->sb with freezing denied before the holder cla=
im is published,
   * so a racing bdev_freeze() can never reach a claim a device add or repl=
ace may
   * still abort.  The deny is taken on a throwaway non-holder probe open, =
then the
   * holder is opened by the probe's dev_t.  Balanced by the caller.
   */
- struct file *btrfs_open_device_deny_freeze(const char *path,
- 					   struct super_block *sb)
+ struct file *btrfs_open_device_deny_freeze(struct btrfs_fs_info *fs_info,
+ 					   const char *path)
  {
  	struct file *probe_file, *bdev_file;
  	int ret;
@@@ -2942,9 -2942,21 +2942,21 @@@
  	}
 =20
  	bdev_file =3D fs_bdev_file_open_by_dev(file_bdev(probe_file)->bd_dev,
- 					     BLK_OPEN_WRITE, sb, sb);
- 	if (IS_ERR(bdev_file))
+ 					     BLK_OPEN_WRITE, fs_info->sb, fs_info->sb);
+ 	if (IS_ERR(bdev_file)) {
  		bdev_allow_freeze(file_bdev(probe_file));
+ 		goto out;
+ 	}
+=20
+ 	ret =3D bdev_validate_blocksize(file_bdev(bdev_file), BTRFS_BDEV_BLOCKSI=
ZE);
+ 	if (ret < 0) {
+ 		fs_bdev_file_release(bdev_file, fs_info->sb);
+ 		bdev_allow_freeze(file_bdev(probe_file));
+ 		btrfs_err(fs_info, "device %s doesn't support blocksize %u",
+ 			  path, BTRFS_BDEV_BLOCKSIZE);
+ 		bdev_file =3D ERR_PTR(ret);
+ 	}
+ out:
  	bdev_fput(probe_file);
  	return bdev_file;
  }
@@@ -2968,7 -2980,7 +2980,7 @@@ int btrfs_init_new_device(struct btrfs_
  		return -EROFS;
 =20
  	/* Forbid freezing until the device is a committed member (or unwound). =
*/
- 	bdev_file =3D btrfs_open_device_deny_freeze(device_path, fs_info->sb);
+ 	bdev_file =3D btrfs_open_device_deny_freeze(fs_info, device_path);
  	if (IS_ERR(bdev_file))
  		return PTR_ERR(bdev_file);
 =20
@@@ -3043,7 -3055,6 +3055,6 @@@
  	 */
  	atomic_inc(&device->dev_stats_ccnt);
  	device->dev_stats_valid =3D 1;
- 	set_blocksize(device->bdev_file, BTRFS_BDEV_BLOCKSIZE);
 =20
  	if (seeding_dev) {
  		/* GFP_KERNEL allocation must not be under device_list_mutex */
@@@ -3206,6 -3217,7 +3217,7 @@@ error_unwind_device
  	btrfs_update_per_profile_avail(fs_info);
  	mutex_unlock(&fs_info->chunk_mutex);
  	mutex_unlock(&fs_info->fs_devices->device_list_mutex);
+ 	synchronize_rcu();
  error_trans:
  	if (trans)
  		btrfs_end_transaction(trans);
@@@ -5616,7 -5628,7 +5628,7 @@@ static int alloc_virtual_chunk(struct b
  	const struct btrfs_raid_attr *raid_attr =3D &btrfs_raid_array[type];
  	struct btrfs_fs_devices *fs_devices =3D fs_info->fs_devices;
  	struct btrfs_device *device;
- 	u64 stripe_size;
+ 	u64 dev_extent_size;
  	int ndevs =3D 0;
 =20
  	lockdep_assert_held(&fs_info->chunk_mutex);
@@@ -5673,14 -5685,14 +5685,14 @@@
  		ndevs =3D min(ndevs, (int)BTRFS_MAX_DEVS(fs_info));
 =20
  	/*
- 	 * Stripe size will be determined by the device with the least
+ 	 * Dev extent size will be determined by the device with the least
  	 * unallocated space.
  	 */
- 	stripe_size =3D devices_info[ndevs - 1].total_avail;
+ 	dev_extent_size =3D devices_info[ndevs - 1].total_avail;
 =20
  	for (int i =3D 0; i < ndevs; i++)
- 		devices_info[i].dev->per_profile_allocated +=3D stripe_size;
- 	*allocated =3D div_u64(stripe_size * (ndevs - raid_attr->nparity),
+ 		devices_info[i].dev->per_profile_allocated +=3D dev_extent_size;
+ 	*allocated =3D div_u64(dev_extent_size * (ndevs - raid_attr->nparity),
  			     raid_attr->ncopies);
  	return 0;
  }
@@@ -5795,10 -5807,10 +5807,10 @@@ struct alloc_chunk_ctl=20
  	int ncopies;
  	/* Number of stripes worth of bytes to store parity information */
  	int nparity;
- 	u64 max_stripe_size;
  	u64 max_chunk_size;
+ 	u64 dev_extent_max;
  	u64 dev_extent_min;
- 	u64 stripe_size;
+ 	u64 dev_extent_size;
  	u64 chunk_size;
  	int ndevs;
  	/* Space_info the block group is going to belong. */
@@@ -5815,7 -5827,7 +5827,7 @@@ static void init_alloc_chunk_ctl_policy
  	ASSERT(space_info);
 =20
  	ctl->max_chunk_size =3D READ_ONCE(space_info->chunk_size);
- 	ctl->max_stripe_size =3D min_t(u64, ctl->max_chunk_size, SZ_1G);
+ 	ctl->dev_extent_max =3D min_t(u64, ctl->max_chunk_size, SZ_1G);
 =20
  	if (ctl->type & BTRFS_BLOCK_GROUP_SYSTEM)
  		ctl->devs_max =3D min_t(int, ctl->devs_max, BTRFS_MAX_DEVS_SYS_CHUNK);
@@@ -5823,7 -5835,8 +5835,8 @@@
  	/* We don't want a chunk larger than 10% of writable space */
  	ctl->max_chunk_size =3D min(mult_perc(fs_devices->total_rw_bytes, 10),
  				  ctl->max_chunk_size);
- 	ctl->dev_extent_min =3D btrfs_stripe_nr_to_offset(ctl->dev_stripes);
+ 	ctl->dev_extent_min =3D btrfs_stripe_nr_to_offset(ctl->dev_stripes,
+ 							BTRFS_STRIPE_LEN);
  }
 =20
  static void init_alloc_chunk_ctl_policy_zoned(
@@@ -5837,14 -5850,14 +5850,14 @@@
  	u64 min_chunk_size =3D min_data_stripes * zone_size;
  	u64 type =3D ctl->type;
 =20
- 	ctl->max_stripe_size =3D zone_size;
+ 	ctl->dev_extent_max =3D zone_size;
  	if (type & BTRFS_BLOCK_GROUP_DATA) {
  		ctl->max_chunk_size =3D round_down(BTRFS_MAX_DATA_CHUNK_SIZE,
  						 zone_size);
  	} else if (type & BTRFS_BLOCK_GROUP_METADATA) {
- 		ctl->max_chunk_size =3D ctl->max_stripe_size;
+ 		ctl->max_chunk_size =3D ctl->dev_extent_max;
  	} else if (type & BTRFS_BLOCK_GROUP_SYSTEM) {
- 		ctl->max_chunk_size =3D 2 * ctl->max_stripe_size;
+ 		ctl->max_chunk_size =3D 2 * ctl->dev_extent_max;
  		ctl->devs_max =3D min_t(int, ctl->devs_max,
  				      BTRFS_MAX_DEVS_SYS_CHUNK);
  	} else {
@@@ -5895,7 -5908,7 +5908,7 @@@ static int gather_device_info(struct bt
  	struct btrfs_fs_info *info =3D fs_devices->fs_info;
  	struct btrfs_device *device;
  	u64 total_avail;
- 	u64 dev_extent_want =3D ctl->max_stripe_size * ctl->dev_stripes;
+ 	u64 dev_extent_want =3D ctl->dev_extent_max * ctl->dev_stripes;
  	int ret;
  	int ndevs =3D 0;
  	u64 max_avail;
@@@ -5965,8 -5978,8 +5978,8 @@@
  	return 0;
  }
 =20
- static int decide_stripe_size_regular(struct alloc_chunk_ctl *ctl,
- 				      struct btrfs_device_info *devices_info)
+ static int decide_dev_extent_size_regular(struct alloc_chunk_ctl *ctl,
+ 					  struct btrfs_device_info *devices_info)
  {
  	/* Number of stripes that count for block group size */
  	int data_stripes;
@@@ -5978,8 -5991,8 +5991,8 @@@
  	 * The DUP profile stores more than one stripe per device, the
  	 * max_avail is the total size so we have to adjust.
  	 */
- 	ctl->stripe_size =3D div_u64(devices_info[ctl->ndevs - 1].max_avail,
- 				   ctl->dev_stripes);
+ 	ctl->dev_extent_size =3D div_u64(devices_info[ctl->ndevs - 1].max_avail,
+ 				       ctl->dev_stripes);
  	ctl->num_stripes =3D ctl->ndevs * ctl->dev_stripes;
 =20
  	/* This will have to be fixed for RAID1 and RAID10 over more drives */
@@@ -5989,31 -6002,31 +6002,31 @@@
  	 * Use the number of data stripes to figure out how big this chunk is
  	 * really going to be in terms of logical address space, and compare
  	 * that answer with the max chunk size. If it's higher, we try to
- 	 * reduce stripe_size.
+ 	 * reduce dev_extent_size.
  	 */
- 	if (ctl->stripe_size * data_stripes > ctl->max_chunk_size) {
+ 	if (ctl->dev_extent_size * data_stripes > ctl->max_chunk_size) {
  		/*
- 		 * Reduce stripe_size, round it up to a 16MB boundary again and
+ 		 * Reduce dev_extent_size, round it up to a 16MB boundary again and
  		 * then use it, unless it ends up being even bigger than the
  		 * previous value we had already.
  		 */
- 		ctl->stripe_size =3D min(round_up(div_u64(ctl->max_chunk_size,
- 							data_stripes), SZ_16M),
- 				       ctl->stripe_size);
+ 		ctl->dev_extent_size =3D min(round_up(div_u64(ctl->max_chunk_size,
+ 							    data_stripes), SZ_16M),
+ 					   ctl->dev_extent_size);
  	}
 =20
- 	/* Stripe size should not go beyond 1G. */
- 	ctl->stripe_size =3D min_t(u64, ctl->stripe_size, SZ_1G);
+ 	/* Dev extent size should not go beyond 1G. */
+ 	ctl->dev_extent_size =3D min_t(u64, ctl->dev_extent_size, SZ_1G);
 =20
  	/* Align to BTRFS_STRIPE_LEN */
- 	ctl->stripe_size =3D round_down(ctl->stripe_size, BTRFS_STRIPE_LEN);
- 	ctl->chunk_size =3D ctl->stripe_size * data_stripes;
+ 	ctl->dev_extent_size =3D round_down(ctl->dev_extent_size, BTRFS_STRIPE_L=
EN);
+ 	ctl->chunk_size =3D ctl->dev_extent_size * data_stripes;
 =20
  	return 0;
  }
 =20
- static int decide_stripe_size_zoned(struct alloc_chunk_ctl *ctl,
- 				    struct btrfs_device_info *devices_info)
+ static int decide_dev_extent_size_zoned(struct alloc_chunk_ctl *ctl,
+ 					struct btrfs_device_info *devices_info)
  {
  	u64 zone_size =3D devices_info[0].dev->zone_info->zone_size;
  	/* Number of stripes that count for block group size */
@@@ -6027,30 -6040,30 +6040,30 @@@
  	       "ndevs=3D%d max_avail=3D%llu dev_extent_min=3D%llu", ctl->ndevs,
  	       devices_info[ctl->ndevs - 1].max_avail, ctl->dev_extent_min);
 =20
- 	ctl->stripe_size =3D zone_size;
+ 	ctl->dev_extent_size =3D zone_size;
  	ctl->num_stripes =3D ctl->ndevs * ctl->dev_stripes;
  	data_stripes =3D (ctl->num_stripes - ctl->nparity) / ctl->ncopies;
 =20
- 	/* stripe_size is fixed in zoned filesystem. Reduce ndevs instead. */
- 	if (ctl->stripe_size * data_stripes > ctl->max_chunk_size) {
+ 	/* dev_extent_size is fixed in zoned filesystem. Reduce ndevs instead. */
+ 	if (ctl->dev_extent_size * data_stripes > ctl->max_chunk_size) {
  		ctl->ndevs =3D div_u64(div_u64(ctl->max_chunk_size * ctl->ncopies,
- 					     ctl->stripe_size) + ctl->nparity,
+ 					     ctl->dev_extent_size) + ctl->nparity,
  				     ctl->dev_stripes);
  		ctl->num_stripes =3D ctl->ndevs * ctl->dev_stripes;
  		data_stripes =3D (ctl->num_stripes - ctl->nparity) / ctl->ncopies;
- 		ASSERT(ctl->stripe_size * data_stripes <=3D ctl->max_chunk_size,
- 		       "stripe_size=3D%llu data_stripes=3D%d max_chunk_size=3D%llu",
- 		       ctl->stripe_size, data_stripes, ctl->max_chunk_size);
+ 		ASSERT(ctl->dev_extent_size * data_stripes <=3D ctl->max_chunk_size,
+ 		       "dev_extent_size=3D%llu data_stripes=3D%d max_chunk_size=3D%llu",
+ 		       ctl->dev_extent_size, data_stripes, ctl->max_chunk_size);
  	}
 =20
- 	ctl->chunk_size =3D ctl->stripe_size * data_stripes;
+ 	ctl->chunk_size =3D ctl->dev_extent_size * data_stripes;
 =20
  	return 0;
  }
 =20
- static int decide_stripe_size(struct btrfs_fs_devices *fs_devices,
- 			      struct alloc_chunk_ctl *ctl,
- 			      struct btrfs_device_info *devices_info)
+ static int decide_dev_extent_size(struct btrfs_fs_devices *fs_devices,
+ 				  struct alloc_chunk_ctl *ctl,
+ 				  struct btrfs_device_info *devices_info)
  {
  	struct btrfs_fs_info *info =3D fs_devices->fs_info;
 =20
@@@ -6077,9 -6090,9 +6090,9 @@@
  		btrfs_warn_unknown_chunk_allocation(fs_devices->chunk_alloc_policy);
  		fallthrough;
  	case BTRFS_CHUNK_ALLOC_REGULAR:
- 		return decide_stripe_size_regular(ctl, devices_info);
+ 		return decide_dev_extent_size_regular(ctl, devices_info);
  	case BTRFS_CHUNK_ALLOC_ZONED:
- 		return decide_stripe_size_zoned(ctl, devices_info);
+ 		return decide_dev_extent_size_zoned(ctl, devices_info);
  	}
  }
 =20
@@@ -6090,7 -6103,7 +6103,7 @@@ static void chunk_map_device_set_bits(s
  		struct btrfs_device *device =3D stripe->dev;
 =20
  		btrfs_set_extent_bit(&device->alloc_state, stripe->physical,
- 				     stripe->physical + map->stripe_size - 1,
+ 				     stripe->physical + map->dev_extent_size - 1,
  				     bits | EXTENT_NOWAIT, NULL);
  	}
  }
@@@ -6102,7 -6115,7 +6115,7 @@@ void btrfs_chunk_map_device_clear_bits(
  		struct btrfs_device *device =3D stripe->dev;
 =20
  		btrfs_clear_extent_bit(&device->alloc_state, stripe->physical,
- 				       stripe->physical + map->stripe_size - 1,
+ 				       stripe->physical + map->dev_extent_size - 1,
  				       bits | EXTENT_NOWAIT, NULL);
  	}
  }
@@@ -6166,6 -6179,12 +6179,12 @@@ struct btrfs_chunk_map *btrfs_alloc_chu
  	refcount_set(&map->refs, 1);
  	RB_CLEAR_NODE(&map->rb_node);
 =20
+ 	/*
+ 	 * Initialize the default stripe len, selftests and some other call
+ 	 * sites relies on the sane default value.
+ 	 */
+ 	map->stripe_len =3D BTRFS_STRIPE_LEN;
+ 	map->stripe_shift =3D ilog2(map->stripe_len);
  	return map;
  }
 =20
@@@ -6199,7 -6218,7 +6218,7 @@@ static struct btrfs_block_group *create
 =20
  	map->start =3D start;
  	map->chunk_len =3D ctl->chunk_size;
- 	map->stripe_size =3D ctl->stripe_size;
+ 	map->dev_extent_size =3D ctl->dev_extent_size;
  	map->on_disk_type =3D type;
  	map->sub_stripes =3D ctl->sub_stripes;
  	map->num_stripes =3D ctl->num_stripes;
@@@ -6210,7 -6229,7 +6229,7 @@@
  			int s =3D i * ctl->dev_stripes + j;
  			map->stripes[s].dev =3D devices_info[i].dev;
  			map->stripes[s].physical =3D devices_info[i].dev_offset +
- 						   j * ctl->stripe_size;
+ 						   j * ctl->dev_extent_size;
  		}
  	}
 =20
@@@ -6233,13 -6252,13 +6252,13 @@@
  		struct btrfs_device *dev =3D map->stripes[i].dev;
 =20
  		btrfs_device_set_bytes_used(dev,
- 					    dev->bytes_used + ctl->stripe_size);
+ 					    dev->bytes_used + ctl->dev_extent_size);
  		if (list_empty(&dev->post_commit_list))
  			list_add_tail(&dev->post_commit_list,
  				      &trans->transaction->dev_update_list);
  	}
 =20
- 	atomic64_sub(ctl->stripe_size * map->num_stripes,
+ 	atomic64_sub(ctl->dev_extent_size * map->num_stripes,
  		     &info->free_chunk_space);
 =20
  	check_raid56_incompat_flag(info, type);
@@@ -6292,7 -6311,7 +6311,7 @@@ struct btrfs_block_group *btrfs_create_
  	if (ret < 0)
  		return ERR_PTR(ret);
 =20
- 	ret =3D decide_stripe_size(fs_devices, &ctl, devices_info);
+ 	ret =3D decide_dev_extent_size(fs_devices, &ctl, devices_info);
  	if (ret < 0)
  		return ERR_PTR(ret);
 =20
@@@ -6381,11 -6400,11 +6400,11 @@@ int btrfs_chunk_alloc_add_chunk_item(st
 =20
  	btrfs_set_stack_chunk_length(chunk, bg->length);
  	btrfs_set_stack_chunk_owner(chunk, BTRFS_EXTENT_TREE_OBJECTID);
- 	btrfs_set_stack_chunk_stripe_len(chunk, BTRFS_STRIPE_LEN);
+ 	btrfs_set_stack_chunk_stripe_len(chunk, map->stripe_len);
  	btrfs_set_stack_chunk_type(chunk, map->on_disk_type);
  	btrfs_set_stack_chunk_num_stripes(chunk, map->num_stripes);
- 	btrfs_set_stack_chunk_io_align(chunk, BTRFS_STRIPE_LEN);
- 	btrfs_set_stack_chunk_io_width(chunk, BTRFS_STRIPE_LEN);
+ 	btrfs_set_stack_chunk_io_align(chunk, map->stripe_len);
+ 	btrfs_set_stack_chunk_io_width(chunk, map->stripe_len);
  	btrfs_set_stack_chunk_sector_size(chunk, fs_info->sectorsize);
  	btrfs_set_stack_chunk_sub_stripes(chunk, map->sub_stripes);
 =20
@@@ -6579,7 -6598,8 +6598,8 @@@ unsigned long btrfs_full_stripe_len(str
 =20
  	if (!WARN_ON(IS_ERR(map))) {
  		if (map->type & BTRFS_BLOCK_GROUP_RAID56_MASK)
- 			len =3D btrfs_stripe_nr_to_offset(nr_data_stripes(map));
+ 			len =3D btrfs_stripe_nr_to_offset(nr_data_stripes(map),
+ 							map->stripe_len);
  		btrfs_free_chunk_map(map);
  	}
  	return len;
@@@ -6776,6 -6796,7 +6796,7 @@@ struct btrfs_discard_stripe *btrfs_map_
  	u64 stripe_end_offset;
  	u64 stripe_offset;
  	u32 stripe_index;
+ 	u32 stripe_len;
  	u32 factor =3D 0;
  	u32 sub_stripes =3D 0;
  	u32 stripes_per_dev =3D 0;
@@@ -6812,6 -6833,7 +6833,7 @@@
  		goto out_free_map;
  	}
 =20
+ 	stripe_len =3D map->stripe_len;
  	offset =3D logical - map->start;
  	length =3D min_t(u64, map->start + map->chunk_len - logical, length);
  	*length_ret =3D length;
@@@ -6820,15 -6842,16 +6842,16 @@@
  	 * stripe_nr counts the total number of stripes we have to stride
  	 * to get to this block
  	 */
- 	stripe_nr =3D offset >> BTRFS_STRIPE_LEN_SHIFT;
+ 	stripe_nr =3D offset >> map->stripe_shift;
 =20
  	/* stripe_offset is the offset of this block in its stripe */
- 	stripe_offset =3D offset - btrfs_stripe_nr_to_offset(stripe_nr);
+ 	stripe_offset =3D offset - btrfs_stripe_nr_to_offset(stripe_nr,
+ 							   stripe_len);
 =20
- 	stripe_nr_end =3D round_up(offset + length, BTRFS_STRIPE_LEN) >>
- 			BTRFS_STRIPE_LEN_SHIFT;
+ 	stripe_nr_end =3D round_up(offset + length, stripe_len) >>
+ 			map->stripe_shift;
  	stripe_cnt =3D stripe_nr_end - stripe_nr;
- 	stripe_end_offset =3D btrfs_stripe_nr_to_offset(stripe_nr_end) -
+ 	stripe_end_offset =3D btrfs_stripe_nr_to_offset(stripe_nr_end, stripe_le=
n) -
  			    (offset + length);
  	/*
  	 * after this, stripe_nr is the number of stripes on this
@@@ -6871,15 -6894,17 +6894,17 @@@
  	for (i =3D 0; i < *num_stripes; i++) {
  		stripes[i].physical =3D
  			map->stripes[stripe_index].physical +
- 			stripe_offset + btrfs_stripe_nr_to_offset(stripe_nr);
+ 			stripe_offset + btrfs_stripe_nr_to_offset(stripe_nr,
+ 								  stripe_len);
  		stripes[i].dev =3D map->stripes[stripe_index].dev;
 =20
  		if (map->type & (BTRFS_BLOCK_GROUP_RAID0 |
  				 BTRFS_BLOCK_GROUP_RAID10)) {
- 			stripes[i].length =3D btrfs_stripe_nr_to_offset(stripes_per_dev);
+ 			stripes[i].length =3D btrfs_stripe_nr_to_offset(stripes_per_dev,
+ 								      stripe_len);
 =20
  			if (i / sub_stripes < remaining_stripes)
- 				stripes[i].length +=3D BTRFS_STRIPE_LEN;
+ 				stripes[i].length +=3D stripe_len;
 =20
  			/*
  			 * Special for the first stripe and
@@@ -7014,18 -7039,21 +7039,21 @@@ static void handle_ops_on_dev_replace(s
  static u64 btrfs_max_io_len(struct btrfs_chunk_map *map, u64 offset,
  			    struct btrfs_io_geometry *io_geom)
  {
+ 	const u32 stripe_len =3D map->stripe_len;
+=20
  	/*
  	 * Stripe_nr is the stripe where this block falls.  stripe_offset is
  	 * the offset of this block in its stripe.
  	 */
- 	io_geom->stripe_offset =3D offset & BTRFS_STRIPE_LEN_MASK;
- 	io_geom->stripe_nr =3D offset >> BTRFS_STRIPE_LEN_SHIFT;
+ 	io_geom->stripe_offset =3D offset & (stripe_len - 1);
+ 	io_geom->stripe_nr =3D offset >> map->stripe_shift;
  	ASSERT(io_geom->stripe_offset < U32_MAX,
  	       "stripe_offset=3D%llu", io_geom->stripe_offset);
 =20
  	if (map->type & BTRFS_BLOCK_GROUP_RAID56_MASK) {
  		unsigned long full_stripe_len =3D
- 			btrfs_stripe_nr_to_offset(nr_data_stripes(map));
+ 			btrfs_stripe_nr_to_offset(nr_data_stripes(map),
+ 						  stripe_len);
 =20
  		/*
  		 * For full stripe start, we use previously calculated
@@@ -7037,7 -7065,8 +7065,8 @@@
  		 * not ensured to be power of 2.
  		 */
  		io_geom->raid56_full_stripe_start =3D btrfs_stripe_nr_to_offset(
- 			rounddown(io_geom->stripe_nr, nr_data_stripes(map)));
+ 			rounddown(io_geom->stripe_nr, nr_data_stripes(map)),
+ 			stripe_len);
 =20
  		ASSERT(io_geom->raid56_full_stripe_start + full_stripe_len > offset,
  		       "raid56_full_stripe_start=3D%llu full_stripe_len=3D%lu offset=3D=
%llu",
@@@ -7058,7 -7087,7 +7087,7 @@@
  	 * a single disk).
  	 */
  	if (map->type & BTRFS_BLOCK_GROUP_STRIPE_MASK)
- 		return BTRFS_STRIPE_LEN - io_geom->stripe_offset;
+ 		return stripe_len - io_geom->stripe_offset;
  	return U64_MAX;
  }
 =20
@@@ -7076,7 -7105,8 +7105,8 @@@ static int set_io_stripe(struct btrfs_f
 =20
  	dst->physical =3D map->stripes[io_geom->stripe_index].physical +
  			io_geom->stripe_offset +
- 			btrfs_stripe_nr_to_offset(io_geom->stripe_nr);
+ 			btrfs_stripe_nr_to_offset(io_geom->stripe_nr,
+ 						  map->stripe_len);
  	return 0;
  }
 =20
@@@ -7199,7 -7229,7 +7229,7 @@@ static void map_blocks_raid56_write(str
  	/* Return the length to the full stripe end. */
  	*length =3D min(logical + *length,
  		      io_geom->raid56_full_stripe_start + map->start +
- 		      btrfs_stripe_nr_to_offset(data_stripes)) -
+ 		      btrfs_stripe_nr_to_offset(data_stripes, map->stripe_len)) -
  		logical;
  	io_geom->stripe_index =3D 0;
  	io_geom->stripe_offset =3D 0;
@@@ -7403,6 -7433,7 +7433,7 @@@ int btrfs_map_block(struct btrfs_fs_inf
  		ret =3D -ENOMEM;
  		goto out;
  	}
+ 	bioc->stripe_len =3D map->stripe_len;
  	bioc->map_type =3D map->type;
  	bioc->use_rst =3D io_geom.use_rst;
 =20
@@@ -7425,7 -7456,8 +7456,8 @@@
  		 */
  		bioc->full_stripe_logical =3D map->start +
  			btrfs_stripe_nr_to_offset(io_geom.stripe_nr *
- 						  nr_data_stripes(map));
+ 						  nr_data_stripes(map),
+ 						  map->stripe_len);
  		for (int i =3D 0; i < io_geom.num_stripes; i++) {
  			struct btrfs_io_stripe *dst =3D &bioc->stripes[i];
  			u32 stripe_index;
@@@ -7435,7 -7467,8 +7467,8 @@@
  			dst->physical =3D
  				map->stripes[stripe_index].physical +
  				io_geom.stripe_offset +
- 				btrfs_stripe_nr_to_offset(io_geom.stripe_nr);
+ 				btrfs_stripe_nr_to_offset(io_geom.stripe_nr,
+ 							  map->stripe_len);
  		}
  	} else {
  		/*
@@@ -7650,7 -7683,7 +7683,7 @@@ static void btrfs_report_missing_device
  			      devid, uuid);
  }
 =20
- u64 btrfs_calc_stripe_length(const struct btrfs_chunk_map *map)
+ u64 btrfs_calc_dev_extent_size(const struct btrfs_chunk_map *map)
  {
  	const int data_stripes =3D calc_data_stripes(map->type, map->num_stripes=
);
 =20
@@@ -7718,11 -7751,20 +7751,20 @@@ static struct btrfs_device *handle_miss
  	return dev;
  }
 =20
- static bool is_same_chunk_map(const struct btrfs_chunk_map *map, u64 logi=
cal,
- 			      u64 length, u64 type, u16 num_stripes)
+ static bool is_same_chunk_map(const struct btrfs_chunk_map *map,
+ 			      const struct extent_buffer *leaf,
+ 			      const struct btrfs_chunk *chunk,
+ 			      u64 logical)
  {
- 	if (map->start !=3D logical || map->chunk_len !=3D length ||
- 	    map->on_disk_type !=3D type || map->num_stripes !=3D num_stripes)
+ 	if (unlikely(map->start !=3D logical))
+ 		return false;
+ 	if (unlikely(map->chunk_len !=3D btrfs_chunk_length(leaf, chunk)))
+ 		return false;
+ 	if (unlikely(map->on_disk_type !=3D btrfs_chunk_type(leaf, chunk)))
+ 		return false;
+ 	if (unlikely(map->stripe_len !=3D btrfs_chunk_stripe_len(leaf, chunk)))
+ 		return false;
+ 	if (unlikely(map->num_stripes !=3D btrfs_chunk_num_stripes(leaf, chunk)))
  		return false;
  	return true;
  }
@@@ -7737,6 -7779,7 +7779,7 @@@ static int read_one_chunk(struct btrfs_
  	u64 length;
  	u64 devid;
  	u64 type;
+ 	u32 stripe_len;
  	u8 uuid[BTRFS_UUID_SIZE];
  	int index;
  	int num_stripes;
@@@ -7747,6 -7790,7 +7790,7 @@@
  	length =3D btrfs_chunk_length(leaf, chunk);
  	type =3D btrfs_chunk_type(leaf, chunk);
  	index =3D btrfs_bg_flags_to_raid_index(type);
+ 	stripe_len =3D btrfs_chunk_stripe_len(leaf, chunk);
  	num_stripes =3D btrfs_chunk_num_stripes(leaf, chunk);
 =20
  #if BITS_PER_LONG =3D=3D 32
@@@ -7760,8 -7804,7 +7804,7 @@@
 =20
  	/* Already mapped? Check if the existing one matches. */
  	if (map) {
- 		if (unlikely(!is_same_chunk_map(map, logical, length,
- 						type, num_stripes))) {
+ 		if (unlikely(!is_same_chunk_map(map, leaf, chunk, logical))) {
  			btrfs_err(fs_info,
  		"existing chunk %llu doesn't match the new one at %llu",
  				  map->start, logical);
@@@ -7781,6 -7824,8 +7824,8 @@@
  	map->chunk_len =3D length;
  	map->num_stripes =3D num_stripes;
  	map->on_disk_type =3D type;
+ 	map->stripe_len =3D stripe_len;
+ 	map->stripe_shift =3D ilog2(map->stripe_len);
  	/*
  	 * We can't use the sub_stripes value, as for profiles other than
  	 * RAID10, they may have 0 as sub_stripes for filesystems created by
@@@ -7794,9 -7839,9 +7839,9 @@@
  	set_real_chunk_type(map);
 =20
  	if (num_stripes > 0)
- 		map->stripe_size =3D btrfs_calc_stripe_length(map);
+ 		map->dev_extent_size =3D btrfs_calc_dev_extent_size(map);
  	else
- 		map->stripe_size =3D 0;
+ 		map->dev_extent_size =3D 0;
 =20
  	for (i =3D 0; i < num_stripes; i++) {
  		map->stripes[i].physical =3D
@@@ -8689,7 -8734,7 +8734,7 @@@ static int verify_one_dev_extent(struc
  	struct btrfs_dev_lookup_args args =3D { .devid =3D devid };
  	struct btrfs_chunk_map *map;
  	struct btrfs_device *dev;
- 	u64 stripe_len;
+ 	u64 dev_extent_size;
  	bool found =3D false;
  	int ret =3D 0;
  	int i;
@@@ -8703,12 -8748,12 +8748,12 @@@
  		goto out;
  	}
 =20
- 	stripe_len =3D btrfs_calc_stripe_length(map);
- 	if (unlikely(physical_len !=3D stripe_len)) {
+ 	dev_extent_size =3D btrfs_calc_dev_extent_size(map);
+ 	if (unlikely(physical_len !=3D dev_extent_size)) {
  		btrfs_err(fs_info,
  "dev extent physical offset %llu on devid %llu length doesn't match chunk=
 %llu, have %llu expect %llu",
  			  physical_offset, devid, map->start, physical_len,
- 			  stripe_len);
+ 			  dev_extent_size);
  		ret =3D -EUCLEAN;
  		goto out;
  	}
@@@ -9059,17 -9104,17 +9104,17 @@@ static void map_raid56_repair_block(str
 =20
  	for (i =3D 0; i < data_stripes; i++) {
  		u64 stripe_start =3D bioc->full_stripe_logical +
- 				   btrfs_stripe_nr_to_offset(i);
+ 				   btrfs_stripe_nr_to_offset(i, bioc->stripe_len);
 =20
  		if (logical >=3D stripe_start &&
- 		    logical < stripe_start + BTRFS_STRIPE_LEN)
+ 		    logical < stripe_start + bioc->stripe_len)
  			break;
  	}
  	ASSERT(i < data_stripes, "i=3D%d data_stripes=3D%d", i, data_stripes);
  	smap->dev =3D bioc->stripes[i].dev;
  	smap->physical =3D bioc->stripes[i].physical +
  			((logical - bioc->full_stripe_logical) &
- 			 BTRFS_STRIPE_LEN_MASK);
+ 			 (bioc->stripe_len - 1));
  }
 =20
  /*

--ttCmLTsHNpqhr+Jt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzR7cACgkQJNaLcl1U
h9Dk8Qf/Qay/GR0ikudt2FwnZyoQDquvJRf5OWIdIb43hZ7TH2ycLJIiFP8bhctt
WRi8lSFIu6xUJoW28jLUsuU4yGKtay5dYpIpKof+eSH3KzhmEi2zdeVwnJpxHE3l
u0penOrOnynasnUzxyrj/W+LVbugGk/PlBMJcf3z3LqZOLBFPV87ZIio982McHSZ
AiqwEVKDgZMMVvPiFj9JNw6r5lDxJPn8LqDMPNBw6kXi5kUzNRGjYeg9I10sywh8
nMST4ptfUYBY7k/ubteh2JXgY2f9eSEpbHn7veSox6Pc8Y/9PNmVyngNtldh9VXG
mnvzZmzqednjehi4d2yDdUEvYZkcuA==
=b4tM
-----END PGP SIGNATURE-----

--ttCmLTsHNpqhr+Jt--
