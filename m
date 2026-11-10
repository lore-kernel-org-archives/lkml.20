Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339287;
	b=RtidZOe63Wb7MJ479XEbGugNTv0i+ponckc364nu+J6igiLP2Gll5Xr7QU/sR2Ks9yoB
	 HMDCQAIItrZFCf9zOP549RZipkE0PNrYnogEfxkdo0grMK52HmGkl7OAFBb3pgAl3h1UV
	 xnNqns0VdJ1FxIERrfgLyDW/i2ycF0b+A/e8vVE4hBn4kTSs13SghLj5n2vuyqo0duOas
	 61er4MtktbsWRiu7FCfsxxKuWJKzbUiyneiC8BAKAKy788XjcLOtAnM+/2AZQTXc28lPj
	 +5Orr665RNbFm1ZUOaRBvRavSmbwBJbL+ofmmoD2UYQUzZpHlssE9d9VarJrA/JxkYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339287;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:MIME-Version:Content-Type:Content-Disposition;
	bh=vDwXMioA+MErO7QIDkYepDUx+poqksR3qNPTFu74w4Y=;
	b=HiW6A8I0/Gsxdowg6WKpJT8uZ85GezWT4PWFsm0gFPW6rHjy3dwi3F/gjyeurdbZRDyT
	 NkJX7iNWmDLRl3uByuPf4a0Pq31+wAv6+MYl2lT8/Big8DR2U6PRadCr5d5XwTwl3oOa1
	 ZAM0DfXC9tJUEV6dwkBFeXOXd7f0dXRzSKadeuZqxS4NXL9gJXCWh7472bpQr7t1lWK8I
	 p6CIYKuX66755Q3oDltmxOc7z3wISZpoWhsTeubzDizyNFd/1EfWaMuzVfhG0/PExMF89
	 PzNbznpntWtZ4kMjo5YxllW3Kv42J8rauiTRjAY2vALHBATU8kPpMfIKU5r5/RdYr5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpxCzOyl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43BD606A32D;
	Tue, 10 Nov 2026 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpxCzOyl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013CD1F008A3;
	Tue, 10 Nov 2026 19:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794339286;
	bh=vDwXMioA+MErO7QIDkYepDUx+poqksR3qNPTFu74w4Y=;
	h=Date:From:To:Cc:Subject;
	b=GpxCzOylhVuTa1Mn6yCbOvLaOUJU2SXlRakHB6Jk44hPocObWfd49pC9X9wxlTY3v
	 szMxwdNTbEWjy23SksHmBk64EYTXMLGKiPozDFsDRXyhG32ylvGPFrud/potQSHLrg
	 vCkZpwW+SGQlfN34hX9xwPwia3p51gMWgBKhOgrtHXD545Y3kqFSMMQFob4lt2Lznh
	 kFd+MlsGMUtL7FxcJm6H/E2wkKd8pZ8J9K72ejvMD6bOZbjXP8BXQMcH6lncoU3LFJ
	 xk8imqFTRikosJ8giNvJN6xCw4XjXqQOsoJu62HOYNnPN/ppDkkIIWPrmX7yVt4sQJ
	 m6GWRKZvjL8qw==
Date: Tue, 10 Nov 2026 19:34:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>,
	Wireless <linux-wireless@vger.kernel.org>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the wireless-next tree with the wireless
 tree
Message-ID: <avNx0gmZTCIjln1Y@sirena.org.uk>
Mail-Followup-To: Johannes Berg <johannes@sipsolutions.net>,
	Wireless <linux-wireless@vger.kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
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
	protocol="application/pgp-signature"; boundary="CPq2Hg4wAwSJn/22"
Content-Disposition: inline


--CPq2Hg4wAwSJn/22
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the wireless-next tree got a conflict in:

  net/wireless/nl80211.c

between commit:

  5e25f6b1b18d5 ("wifi: nl80211: fix ERR_PTR use on wdev disappearance")

=66rom the wireless tree and commit:

  a357675fd7406 ("wifi: cfg80211: enable context analysis")

=66rom the wireless-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/wireless/nl80211.c
index e7dd32880598f,d28eb9baa1b32..0000000000000
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@@ -230,11 -230,12 +230,12 @@@ cfg80211_get_dev_from_info(struct net *
   *
   * Returns with wiphy mutex held unless there was an error.
   */
- static struct wireless_dev *
- nl80211_lock_and_recheck(struct cfg80211_registered_device *rdev,
- 			 struct net *netns, u32 wdev_id)
+ static int nl80211_lock_and_recheck(struct cfg80211_registered_device *rd=
ev,
+ 				    struct net *netns, u32 wdev_id,
+ 				    struct wireless_dev **wdev)
+ 	__cond_acquires(0, &rdev->wiphy.mtx)
  {
- 	struct wireless_dev *wdev;
+ 	struct wireless_dev *tmp;
 =20
  	wiphy_lock(&rdev->wiphy);
 =20
@@@ -242,7 -243,7 +243,7 @@@
  	    !net_eq(wiphy_net(&rdev->wiphy), netns)) {
  		wiphy_unlock(&rdev->wiphy);
  		put_device(&rdev->wiphy.dev);
- 		return ERR_PTR(-ENODEV);
+ 		return -ENODEV;
  	}
 =20
  	/*
@@@ -251,19 -252,22 +252,22 @@@
  	 */
  	put_device(&rdev->wiphy.dev);
 =20
- 	if (!wdev_id)
- 		return NULL;
+ 	if (!wdev_id) {
+ 		*wdev =3D NULL;
+ 		return 0;
+ 	}
 =20
- 	list_for_each_entry(wdev, &rdev->wiphy.wdev_list, list) {
- 		if (wdev->identifier !=3D wdev_id)
+ 	list_for_each_entry(tmp, &rdev->wiphy.wdev_list, list) {
+ 		if (tmp->identifier !=3D wdev_id)
  			continue;
- 		if (wdev->netdev && !net_eq(dev_net(wdev->netdev), netns))
+ 		if (tmp->netdev && !net_eq(dev_net(tmp->netdev), netns))
  			break;
- 		return wdev;
+ 		*wdev =3D tmp;
+ 		return 0;
  	}
  	wiphy_unlock(&rdev->wiphy);
 =20
- 	return ERR_PTR(-ENODEV);
+ 	return -ENODEV;
  }
 =20
  /* like nl80211_lock_and_recheck() but under RCU, for wdev_hold() */
@@@ -290,36 -294,51 +294,51 @@@ nl80211_wdev_by_id_rcu(struct cfg80211_
  /*
   * Must have wdev_hold(), acquire the wiphy mutex. This has to
   * look up the wdev again (otherwise it could deadlock against
-  * wdev removal), so it can return an error pointer.
+  * wdev removal), so it can return NULL.
   */
- static struct wireless_dev *
- __nl80211_lock_held_wdev(struct cfg80211_registered_device *rdev,
- 			 struct net *netns, struct wireless_dev *wdev)
+ static int __nl80211_lock_held_wdev(struct cfg80211_registered_device *rd=
ev,
+ 				    struct net *netns,
+ 				    struct wireless_dev *wdev)
+ 	__cond_acquires(0, &rdev->wiphy.mtx)
  {
  	u32 wdev_id =3D wdev->identifier;
+ 	struct wireless_dev *tmp;
+ 	int err;
 =20
  	/* the wdev reference was keeping the wiphy alive */
  	get_device(&rdev->wiphy.dev);
  	wdev_put(wdev);
 =20
- 	return nl80211_lock_and_recheck(rdev, netns, wdev_id);
+ 	err =3D nl80211_lock_and_recheck(rdev, netns, wdev_id, &tmp);
+ 	if (err)
+ 		return err;
+=20
+ 	if (WARN_ON(!tmp || tmp !=3D wdev)) {
+ 		wiphy_unlock(&rdev->wiphy);
+ 		return -EINVAL;
+ 	}
+=20
+ 	return 0;
  }
 =20
- static struct wireless_dev *
- nl80211_lock_held_wdev(struct cfg80211_registered_device *rdev,
- 		       struct genl_info *info, struct wireless_dev *wdev)
+ static int nl80211_lock_held_wdev(struct cfg80211_registered_device *rdev,
+ 				  struct genl_info *info,
+ 				  struct wireless_dev *wdev)
+ 	__cond_acquires(0, &rdev->wiphy.mtx)
  {
+ 	int err;
+=20
  	info->user_ptr[1] =3D NULL;
- 	wdev =3D __nl80211_lock_held_wdev(rdev, genl_info_net(info), wdev);
- 	if (IS_ERR(wdev))
- 		return wdev;
+ 	err =3D __nl80211_lock_held_wdev(rdev, genl_info_net(info), wdev);
+ 	if (err)
+ 		return err;
 =20
  	if (!wdev_running(wdev)) {
  		wiphy_unlock(&rdev->wiphy);
- 		return ERR_PTR(-ENETDOWN);
+ 		return -ENETDOWN;
  	}
 =20
- 	return wdev;
+ 	return 0;
  }
 =20
  static int validate_beacon_head(const struct nlattr *attr,
@@@ -1358,6 -1377,7 +1377,7 @@@ static int __nl80211_prepare_wdev_dump(
  				       struct cfg80211_registered_device **rdev,
  				       struct wireless_dev **wdev,
  				       struct nlattr **attrbuf, bool lock)
+ 	__cond_acquires(0, &(*rdev)->wiphy.mtx)
  {
  	struct net *netns =3D sock_net(cb->skb->sk);
  	u32 wdev_id;
@@@ -1410,13 -1430,15 +1430,15 @@@
  		if (!*wdev)
  			return -ENODEV;
  	} else {
+ 		int ret;
+=20
  		get_device(&(*rdev)->wiphy.dev);
  		rcu_read_unlock();
 =20
  		/* things may have changed since the lookup or last dumpit */
- 		*wdev =3D nl80211_lock_and_recheck(*rdev, netns, wdev_id);
- 		if (IS_ERR(*wdev))
- 			return PTR_ERR(*wdev);
+ 		ret =3D nl80211_lock_and_recheck(*rdev, netns, wdev_id, wdev);
+ 		if (ret)
+ 			return ret;
  	}
 =20
  	/* 0 is the first index - add 1 to parse only once */
@@@ -1430,6 -1452,7 +1452,7 @@@ static int nl80211_prepare_wdev_dump(st
  				     struct cfg80211_registered_device **rdev,
  				     struct wireless_dev **wdev,
  				     struct nlattr **attrbuf)
+ 	__cond_acquires(0, &(*rdev)->wiphy.mtx)
  {
  	return __nl80211_prepare_wdev_dump(cb, rdev, wdev, attrbuf, true);
  }
@@@ -3415,6 -3438,9 +3438,9 @@@ static int nl80211_send_wiphy(struct cf
  			if (rdev->wiphy.sar_capa)
  				CMD(set_sar_specs, SET_SAR_SPECS);
  			CMD(assoc_ml_reconf, ASSOC_MLO_RECONF);
+=20
+ 			if (rdev->wiphy.flags & WIPHY_FLAG_SMD_TRANSITION_CLIENT)
+ 				CMD(execute_st, EXECUTE_SMD_TRANSITION);
  		}
  #undef CMD
 =20
@@@ -4679,8 -4705,9 +4705,8 @@@ static int nl80211_set_wiphy(struct sk_
  			return -EOPNOTSUPP;
 =20
  		if (rdev->wiphy.n_radio) {
 -			old_radio_rts_threshold =3D kcalloc(rdev->wiphy.n_radio,
 -							  sizeof(u32),
 -							  GFP_KERNEL);
 +			old_radio_rts_threshold =3D kzalloc_objs(u32,
 +							       rdev->wiphy.n_radio);
  			if (!old_radio_rts_threshold)
  				return -ENOMEM;
  		}
@@@ -5380,6 -5407,8 +5406,8 @@@ static int nl80211_new_interface(struc
  }
 =20
  static int nl80211_del_interface(struct sk_buff *skb, struct genl_info *i=
nfo)
+ 	/* clang cannot see pre_doit acquiring it for us */
+ 	__must_hold(&((struct cfg80211_registered_device *)info->user_ptr[0])->w=
iphy.mtx)
  {
  	struct cfg80211_registered_device *rdev =3D info->user_ptr[0];
  	struct wireless_dev *wdev =3D info->user_ptr[1];
@@@ -5438,6 -5467,8 +5466,8 @@@ static int nl80211_validate_key_link_id
  					struct wireless_dev *wdev,
  					int link_id, bool pairwise)
  {
+ 	struct cfg80211_registered_device *rdev =3D info->user_ptr[0];
+=20
  	if (pairwise) {
  		if (link_id !=3D -1) {
  			GENL_SET_ERR_MSG(info,
@@@ -5454,7 -5485,9 +5484,9 @@@
  					 "link ID must be set for MLO group key");
  			return -EINVAL;
  		}
- 		if (!(wdev->valid_links & BIT(link_id))) {
+ 		/* for SMD transition support the driver must check itself */
+ 		if (!(wdev->valid_links & BIT(link_id)) &&
+ 		    !(rdev->wiphy.flags & WIPHY_FLAG_SMD_TRANSITION_CLIENT)) {
  			GENL_SET_ERR_MSG(info, "invalid link ID for MLO group key");
  			return -EINVAL;
  		}
@@@ -5564,6 -5597,8 +5596,8 @@@ static int nl80211_get_key(struct sk_bu
  	if (!rdev->ops->get_key)
  		return -EOPNOTSUPP;
 =20
+ 	mac_addr =3D cfg80211_get_key_mac_addr(wdev, 0, pairwise, mac_addr);
+=20
  	if (!cfg80211_valid_key_idx(wdev, key_idx, type, mac_addr))
  		return -ENOENT;
 =20
@@@ -5765,6 -5800,10 +5799,10 @@@ static int nl80211_new_key(struct sk_bu
  	if (!rdev->ops->add_key)
  		return -EOPNOTSUPP;
 =20
+ 	mac_addr =3D cfg80211_get_key_mac_addr(wdev, key.p.cipher,
+ 					     key.type =3D=3D NL80211_KEYTYPE_PAIRWISE,
+ 					     mac_addr);
+=20
  	if (cfg80211_validate_key_settings(rdev, wdev, &key.p, key.idx,
  					   key.type, mac_addr)) {
  		GENL_SET_ERR_MSG(info, "key setting validation failed");
@@@ -5794,7 -5833,7 +5832,7 @@@ static int nl80211_del_key(struct sk_bu
  	struct cfg80211_registered_device *rdev =3D info->user_ptr[0];
  	int err;
  	struct wireless_dev *wdev =3D info->user_ptr[1];
- 	u8 *mac_addr =3D NULL;
+ 	const u8 *mac_addr =3D NULL;
  	struct key_parse key;
  	int link_id =3D nl80211_link_id_or_invalid(info->attrs);
 =20
@@@ -5820,6 -5859,10 +5858,10 @@@
  		return -EINVAL;
  	}
 =20
+ 	mac_addr =3D cfg80211_get_key_mac_addr(wdev, 0,
+ 					     key.type =3D=3D NL80211_KEYTYPE_PAIRWISE,
+ 					     mac_addr);
+=20
  	if (!cfg80211_valid_key_idx(wdev, key.idx, key.type, mac_addr))
  		return -EINVAL;
 =20
@@@ -7707,6 -7750,13 +7749,13 @@@ static int nl80211_parse_ap_update(stru
  			return err;
  	}
 =20
+ 	attr =3D attrs[NL80211_ATTR_HE_OBSS_PD];
+ 	if (attr) {
+ 		err =3D nl80211_parse_he_obss_pd(attr, &params->he_obss_pd);
+ 		if (err)
+ 			return err;
+ 	}
+=20
  	return 0;
  }
 =20
@@@ -8940,6 -8990,7 +8989,7 @@@ static int nl80211_fill_station_info(st
 =20
  static int nl80211_dump_station(struct sk_buff *skb,
  				struct netlink_callback *cb)
+ 	__context_unsafe("can't cope with the locked variable")
  {
  	struct cfg80211_registered_device *rdev;
  	struct wireless_dev *wdev;
@@@ -9026,10 -9077,10 +9076,10 @@@
  				memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
 =20
  				/* this fails if the wdev is being removed */
- 				wdev =3D __nl80211_lock_held_wdev(rdev, netns,
- 								wdev);
- 				if (IS_ERR(wdev))
- 					return PTR_ERR(wdev);
+ 				err =3D __nl80211_lock_held_wdev(rdev, netns,
+ 							       wdev);
+ 				if (err)
+ 					goto out_err;
 =20
  				/* try again locked now */
  				locked =3D true;
@@@ -9148,6 -9199,7 +9198,7 @@@ static int nl80211_dump_station_done(st
  }
 =20
  static int nl80211_get_station(struct sk_buff *skb, struct genl_info *inf=
o)
+ 	__context_unsafe("can't cope with the locked variable")
  {
  	struct cfg80211_registered_device *rdev =3D info->user_ptr[0];
  	struct wireless_dev *wdev =3D info->user_ptr[1];
@@@ -9198,11 -9250,8 +9249,8 @@@
  		/* the wdev pointer is only valid until unlocking after this */
  		info->user_ptr[1] =3D NULL;
  		/* can fail if the wdev is being removed */
- 		wdev =3D __nl80211_lock_held_wdev(rdev, genl_info_net(info),
- 						wdev);
- 		if (IS_ERR(wdev)) {
- 			err =3D PTR_ERR(wdev);
- 		} else {
+ 		err =3D __nl80211_lock_held_wdev(rdev, genl_info_net(info), wdev);
+ 		if (!err) {
  			locked =3D true;
  			err =3D rdev_get_station(rdev, wdev, mac_addr, &sinfo);
  		}
@@@ -10320,8 -10369,6 +10368,6 @@@ static int nl80211_dump_mpath(struct sk
  	err =3D nl80211_prepare_wdev_dump(cb, &rdev, &wdev, NULL);
  	if (err)
  		return err;
- 	/* nl80211_prepare_wdev_dump acquired it in the successful case */
- 	__acquire(&rdev->wiphy.mtx);
 =20
  	if (!rdev->ops->dump_mpath) {
  		err =3D -EOPNOTSUPP;
@@@ -10520,8 -10567,6 +10566,6 @@@ static int nl80211_dump_mpp(struct sk_b
  	err =3D nl80211_prepare_wdev_dump(cb, &rdev, &wdev, NULL);
  	if (err)
  		return err;
- 	/* nl80211_prepare_wdev_dump acquired it in the successful case */
- 	__acquire(&rdev->wiphy.mtx);
 =20
  	if (!rdev->ops->dump_mpp) {
  		err =3D -EOPNOTSUPP;
@@@ -11993,7 -12038,7 +12037,7 @@@ static int nl80211_trigger_scan(struct=
=20
 =20
   out_free:
  	rdev->scan_req =3D NULL;
- 	kfree(request);
+ 	kfree_rcu(request, rcu_head);
 =20
  	return err;
  }
@@@ -13076,8 -13121,6 +13120,6 @@@ static int nl80211_dump_scan(struct sk_
  		kfree(attrbuf);
  		return err;
  	}
- 	/* nl80211_prepare_wdev_dump acquired it in the successful case */
- 	__acquire(&rdev->wiphy.mtx);
 =20
  	dump_include_use_data =3D
  		attrbuf[NL80211_ATTR_BSS_DUMP_INCLUDE_USE_DATA];
@@@ -13216,8 -13259,6 +13258,6 @@@ static int nl80211_dump_survey(struct s
  		kfree(attrbuf);
  		return res;
  	}
- 	/* nl80211_prepare_wdev_dump acquired it in the successful case */
- 	__acquire(&rdev->wiphy.mtx);
 =20
  	/* prepare_wdev_dump parsed the attributes */
  	radio_stats =3D attrbuf[NL80211_ATTR_SURVEY_RADIO_STATS];
@@@ -15420,10 -15461,8 +15460,8 @@@ static int nl80211_tx_mgmt(struct sk_bu
  	/* pre_doit didn't lock the wiphy mutex, try without */
  	err =3D cfg80211_mlme_mgmt_tx_unlocked(rdev, wdev, &params, cookie);
  	if (err =3D=3D -EAGAIN) {
- 		wdev =3D nl80211_lock_held_wdev(rdev, info, wdev);
- 		if (IS_ERR(wdev)) {
- 			err =3D PTR_ERR(wdev);
- 		} else {
+ 		err =3D nl80211_lock_held_wdev(rdev, info, wdev);
+ 		if (!err) {
  			err =3D nl80211_tx_mgmt_locked(rdev, wdev, &params,
  						     cookie);
  			wiphy_unlock(&rdev->wiphy);
@@@ -18294,7 -18333,8 +18332,7 @@@ nl80211_parse_non_evac_channel(struct c
  			       struct cfg80211_chan_def *chandef)
  {
  	struct nlattr **channel_parsed __free(kfree) =3D
 -		kcalloc(NL80211_ATTR_MAX + 1, sizeof(*channel_parsed),
 -			GFP_KERNEL);
 +		kzalloc_objs(*channel_parsed, NL80211_ATTR_MAX + 1);
  	int ret;
 =20
  	if (!channel_parsed)
@@@ -18329,7 -18369,8 +18367,7 @@@ static int nl80211_nan_set_non_evac_cha
  		n_channels++;
 =20
  	struct cfg80211_nan_non_evac_channels *channels __free(kfree) =3D
 -		kzalloc(struct_size(channels, chandefs, n_channels),
 -			GFP_KERNEL);
 +		kzalloc_flex(*channels, chandefs, n_channels);
  	if (!channels)
  		return -ENOMEM;
 =20
@@@ -19996,6 -20037,148 +20034,148 @@@ nl80211_epcs_cfg(struct sk_buff *skb=
, s
  	return rdev_set_epcs(rdev, dev, val);
  }
 =20
+ static int nl80211_prepare_st(struct sk_buff *skb, struct genl_info *info)
+ {
+ 	struct cfg80211_registered_device *rdev =3D info->user_ptr[0];
+ 	struct net_device *dev =3D info->user_ptr[1];
+ 	struct wireless_dev *wdev =3D dev->ieee80211_ptr;
+ 	struct cfg80211_st_prep_request req =3D {};
+ 	bool have_link =3D false;
+ 	int err;
+=20
+ 	if (!wdev->valid_links)
+ 		return -EINVAL;
+=20
+ 	if (!(rdev->wiphy.flags & WIPHY_FLAG_SMD_TRANSITION_CLIENT))
+ 		return -EOPNOTSUPP;
+=20
+ 	if (dev->ieee80211_ptr->conn_owner_nlportid &&
+ 	    dev->ieee80211_ptr->conn_owner_nlportid !=3D info->snd_portid)
+ 		return -EPERM;
+=20
+ 	if (wdev->iftype !=3D NL80211_IFTYPE_STATION &&
+ 	    wdev->iftype !=3D NL80211_IFTYPE_P2P_CLIENT)
+ 		return -EOPNOTSUPP;
+=20
+ 	if (!info->attrs[NL80211_ATTR_MLD_ADDR] ||
+ 	    !info->attrs[NL80211_ATTR_MLO_LINKS])
+ 		return -EINVAL;
+=20
+ 	req.ap_mld_addr =3D nla_data(info->attrs[NL80211_ATTR_MLD_ADDR]);
+=20
+ 	if (ether_addr_equal(req.ap_mld_addr, wdev->u.client.connected_addr))
+ 		return -EINVAL;
+=20
+ 	if (info->attrs[NL80211_ATTR_IE]) {
+ 		req.elems =3D nla_data(info->attrs[NL80211_ATTR_IE]);
+ 		req.elems_len =3D nla_len(info->attrs[NL80211_ATTR_IE]);
+ 	}
+=20
+ 	if (info->attrs[NL80211_ATTR_EXT_MLD_CAPA_AND_OPS])
+ 		req.ext_mld_capa_ops =3D
+ 			nla_get_u16(info->attrs[NL80211_ATTR_EXT_MLD_CAPA_AND_OPS]);
+=20
+ 	err =3D nl80211_process_links(rdev, req.links,
+ 				    IEEE80211_MLD_MAX_NUM_LINKS,
+ 				    NULL, 0, info);
+ 	if (err)
+ 		goto free;
+=20
+ 	for (int link_id =3D 0; link_id < ARRAY_SIZE(req.links); link_id++) {
+ 		if (req.links[link_id].bss) {
+ 			have_link =3D true;
+ 			break;
+ 		}
+ 	}
+=20
+ 	if (!have_link) {
+ 		err =3D -EINVAL;
+ 		goto free;
+ 	}
+=20
+ 	return cfg80211_prepare_st(rdev, dev, &req);
+ free:
+ 	for (int link_id =3D 0; link_id < ARRAY_SIZE(req.links); link_id++)
+ 		cfg80211_put_bss(&rdev->wiphy, req.links[link_id].bss);
+ 	return err;
+ }
+=20
+ static int nl80211_execute_st(struct sk_buff *skb, struct genl_info *info)
+ {
+ 	struct cfg80211_registered_device *rdev =3D info->user_ptr[0];
+ 	struct net_device *dev =3D info->user_ptr[1];
+ 	struct wireless_dev *wdev =3D dev->ieee80211_ptr;
+ 	struct cfg80211_st_exec_request req =3D {
+ 		.drain_tids =3D 0xFF, /* only 8 TIDs in ST preparation */
+ 	};
+=20
+ 	if (!wdev->valid_links)
+ 		return -EINVAL;
+=20
+ 	if (!(rdev->wiphy.flags & WIPHY_FLAG_SMD_TRANSITION_CLIENT))
+ 		return -EOPNOTSUPP;
+=20
+ 	if (dev->ieee80211_ptr->conn_owner_nlportid &&
+ 	    dev->ieee80211_ptr->conn_owner_nlportid !=3D info->snd_portid)
+ 		return -EPERM;
+=20
+ 	if (wdev->iftype !=3D NL80211_IFTYPE_STATION &&
+ 	    wdev->iftype !=3D NL80211_IFTYPE_P2P_CLIENT)
+ 		return -EOPNOTSUPP;
+=20
+ 	if (!info->attrs[NL80211_ATTR_MLD_ADDR])
+ 		return -EINVAL;
+=20
+ 	req.ap_mld_addr =3D nla_data(info->attrs[NL80211_ATTR_MLD_ADDR]);
+=20
+ 	if (info->attrs[NL80211_ATTR_TID_BITMAP]) {
+ 		u16 drain_tids =3D
+ 			nla_get_u16(info->attrs[NL80211_ATTR_TID_BITMAP]);
+=20
+ 		if (drain_tids > 0xFF)
+ 			return -EINVAL;
+=20
+ 		req.drain_tids =3D drain_tids;
+ 	}
+=20
+ 	if (info->attrs[NL80211_ATTR_IE]) {
+ 		req.elems =3D nla_data(info->attrs[NL80211_ATTR_IE]);
+ 		req.elems_len =3D nla_len(info->attrs[NL80211_ATTR_IE]);
+ 	}
+=20
+ 	return rdev_execute_st(rdev, dev, &req);
+ }
+=20
+ static int nl80211_abandon_st(struct sk_buff *skb, struct genl_info *info)
+ {
+ 	struct cfg80211_registered_device *rdev =3D info->user_ptr[0];
+ 	struct net_device *dev =3D info->user_ptr[1];
+ 	struct wireless_dev *wdev =3D dev->ieee80211_ptr;
+ 	const u8 *ap_mld_addr;
+=20
+ 	if (!wdev->valid_links)
+ 		return -EINVAL;
+=20
+ 	if (dev->ieee80211_ptr->conn_owner_nlportid &&
+ 	    dev->ieee80211_ptr->conn_owner_nlportid !=3D info->snd_portid)
+ 		return -EPERM;
+=20
+ 	if (!(rdev->wiphy.flags & WIPHY_FLAG_SMD_TRANSITION_CLIENT))
+ 		return -EOPNOTSUPP;
+=20
+ 	if (wdev->iftype !=3D NL80211_IFTYPE_STATION &&
+ 	    wdev->iftype !=3D NL80211_IFTYPE_P2P_CLIENT)
+ 		return -EOPNOTSUPP;
+=20
+ 	if (!info->attrs[NL80211_ATTR_MLD_ADDR])
+ 		return -EINVAL;
+=20
+ 	ap_mld_addr =3D nla_data(info->attrs[NL80211_ATTR_MLD_ADDR]);
+=20
+ 	return rdev_abandon_st(rdev, dev, ap_mld_addr,
+ 			       info->attrs[NL80211_ATTR_LOCAL_STATE_CHANGE]);
+ }
+=20
  #define NL80211_FLAG_NEED_WIPHY		0x01
  #define NL80211_FLAG_NEED_NETDEV	0x02
  #define NL80211_FLAG_NEED_RTNL		0x04
@@@ -20115,6 -20298,7 +20295,7 @@@ static bool nl80211_need_wdev_ref(u32 i
  static int nl80211_pre_doit(const struct genl_split_ops *ops,
  			    struct sk_buff *skb,
  			    struct genl_info *info)
+ 	__context_unsafe("can't cope with the need_rtnl variable")
  {
  	struct cfg80211_registered_device *rdev =3D NULL;
  	struct net *netns =3D genl_info_net(info);
@@@ -20184,11 -20368,9 +20365,9 @@@
  			wiphy_lock(&rdev->wiphy);
  		} else {
  			/* without rtnl, things may have changed since lookup */
- 			wdev =3D nl80211_lock_and_recheck(rdev, netns, wdev_id);
- 			if (IS_ERR(wdev)) {
- 				err =3D PTR_ERR(wdev);
+ 			err =3D nl80211_lock_and_recheck(rdev, netns, wdev_id, &wdev);
+ 			if (err)
  				goto out;
- 			}
  		}
  		locked =3D true;
  	} else if (rdev && !need_rtnl) {
@@@ -21345,6 -21527,24 +21524,24 @@@ static const struct genl_small_ops nl80
  		.internal_flags =3D IFLAGS(NL80211_FLAG_NEED_NETDEV_UP |
  					 NL80211_FLAG_NO_WIPHY_MTX),
  	},
+ 	{
+ 		.cmd =3D NL80211_CMD_PREPARE_SMD_TRANSITION,
+ 		.doit =3D nl80211_prepare_st,
+ 		.flags =3D GENL_UNS_ADMIN_PERM,
+ 		.internal_flags =3D IFLAGS(NL80211_FLAG_NEED_NETDEV_UP),
+ 	},
+ 	{
+ 		.cmd =3D NL80211_CMD_EXECUTE_SMD_TRANSITION,
+ 		.doit =3D nl80211_execute_st,
+ 		.flags =3D GENL_UNS_ADMIN_PERM,
+ 		.internal_flags =3D IFLAGS(NL80211_FLAG_NEED_NETDEV_UP),
+ 	},
+ 	{
+ 		.cmd =3D NL80211_CMD_ABANDON_SMD_TRANSITION,
+ 		.doit =3D nl80211_abandon_st,
+ 		.flags =3D GENL_UNS_ADMIN_PERM,
+ 		.internal_flags =3D IFLAGS(NL80211_FLAG_NEED_NETDEV_UP),
+ 	},
  };
 =20
  static struct genl_family nl80211_fam __ro_after_init =3D {
@@@ -21687,6 -21887,7 +21884,7 @@@ struct nl80211_mlme_event=20
  	const u8 *req_ies;
  	size_t req_ies_len;
  	bool reconnect;
+ 	const u8 *mld_addr;
  };
 =20
  static void nl80211_send_mlme_event(struct cfg80211_registered_device *rd=
ev,
@@@ -21709,12 -21910,17 +21907,17 @@@
 =20
  	if (nla_put_u32(msg, NL80211_ATTR_WIPHY, rdev->wiphy_idx) ||
  	    nla_put_u32(msg, NL80211_ATTR_IFINDEX, netdev->ifindex) ||
- 	    nla_put(msg, NL80211_ATTR_FRAME, event->buf_len, event->buf) ||
+ 	    (event->buf_len &&
+ 	     nla_put(msg, NL80211_ATTR_FRAME, event->buf_len, event->buf)) ||
  	    (event->req_ies &&
  	     nla_put(msg, NL80211_ATTR_REQ_IE, event->req_ies_len,
  		     event->req_ies)))
  		goto nla_put_failure;
 =20
+ 	if (event->mld_addr &&
+ 	    nla_put(msg, NL80211_ATTR_MLD_ADDR, ETH_ALEN, event->mld_addr))
+ 		goto nla_put_failure;
+=20
  	if (event->reconnect &&
  	    nla_put_flag(msg, NL80211_ATTR_RECONNECT_REQUESTED))
  		goto nla_put_failure;
@@@ -22202,7 -22408,6 +22405,6 @@@ void cfg80211_links_removed(struct net_
  		return;
 =20
  	cfg80211_wdev_release_link_bsses(wdev, link_mask);
- 	wdev->valid_links &=3D ~link_mask;
 =20
  	msg =3D nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
  	if (!msg)
@@@ -22266,6 -22471,169 +22468,169 @@@ void nl80211_mlo_reconf_add_done(str=
uc
  	nl80211_send_mlme_event(rdev, dev, &event, GFP_KERNEL);
  }
 =20
+ void nl80211_st_preparation_response(struct cfg80211_registered_device *r=
dev,
+ 				     struct net_device *dev,
+ 				     struct cfg80211_st_preparation_resp_data *data)
+ {
+ 	struct nl80211_mlme_event event =3D {
+ 		.cmd =3D NL80211_CMD_PREPARE_SMD_TRANSITION,
+ 		.buf =3D data->buf,
+ 		.buf_len =3D data->len,
+ 		.req_ies =3D data->req_elems,
+ 		.req_ies_len =3D data->req_elems_len,
+ 		.mld_addr =3D data->ap_mld_addr,
+ 	};
+=20
+ 	nl80211_send_mlme_event(rdev, dev, &event, GFP_KERNEL);
+ }
+=20
+ void nl80211_st_execution_response(struct cfg80211_registered_device *rde=
v,
+ 				   struct net_device *dev,
+ 				   struct cfg80211_st_execution_resp_data *data)
+ {
+ 	size_t link_info_size =3D NLA_HDRLEN +
+ 				nla_total_size(sizeof(u8)) +
+ 				nla_total_size(ETH_ALEN) +
+ 				nla_total_size(ETH_ALEN);
+ 	struct nlattr *nested;
+ 	struct sk_buff *msg;
+ 	int link_count =3D 0;
+ 	void *hdr;
+ 	int i =3D 1;
+=20
+ 	for (unsigned int link =3D 0; link < IEEE80211_MLD_MAX_NUM_LINKS; link++=
) {
+ 		if (!data->links[link].bssid ||
+ 		    WARN_ON(!data->links[link].local_addr))
+ 			continue;
+=20
+ 		link_count++;
+ 	}
+=20
+ 	msg =3D nlmsg_new(100 + data->len + link_info_size * link_count,
+ 			GFP_KERNEL);
+ 	if (!msg)
+ 		return;
+=20
+ 	hdr =3D nl80211hdr_put(msg, 0, 0, 0, NL80211_CMD_EXECUTE_SMD_TRANSITION);
+ 	if (!hdr) {
+ 		nlmsg_free(msg);
+ 		return;
+ 	}
+=20
+ 	if (nla_put_u32(msg, NL80211_ATTR_WIPHY, rdev->wiphy_idx) ||
+ 	    nla_put_u32(msg, NL80211_ATTR_IFINDEX, dev->ifindex) ||
+ 	    nla_put(msg, NL80211_ATTR_MLD_ADDR, ETH_ALEN, data->ap_mld_addr))
+ 		goto nla_put_failure;
+=20
+ 	if (!data->len)
+ 		goto send;
+=20
+ 	if (nla_put(msg, NL80211_ATTR_FRAME, data->len, data->buf))
+ 		goto nla_put_failure;
+=20
+ 	nested =3D nla_nest_start(msg, NL80211_ATTR_MLO_LINKS);
+ 	if (!nested)
+ 		goto nla_put_failure;
+=20
+ 	for (unsigned int link =3D 0; link < IEEE80211_MLD_MAX_NUM_LINKS; link++=
) {
+ 		const u8 *bssid =3D data->links[link].bssid;
+ 		const u8 *local_addr =3D data->links[link].local_addr;
+ 		struct nlattr *nested_mlo_links;
+=20
+ 		if (!bssid || !local_addr)
+ 			continue;
+=20
+ 		nested_mlo_links =3D nla_nest_start(msg, i);
+ 		if (!nested_mlo_links)
+ 			goto nla_put_failure;
+=20
+ 		if (nla_put_u8(msg, NL80211_ATTR_MLO_LINK_ID, link) ||
+ 		    nla_put(msg, NL80211_ATTR_BSSID, ETH_ALEN, bssid) ||
+ 		    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, local_addr))
+ 			goto nla_put_failure;
+=20
+ 		nla_nest_end(msg, nested_mlo_links);
+ 		i++;
+ 	}
+ 	nla_nest_end(msg, nested);
+=20
+ send:
+ 	genlmsg_end(msg, hdr);
+=20
+ 	genlmsg_multicast_netns(&nl80211_fam, wiphy_net(&rdev->wiphy), msg, 0,
+ 				NL80211_MCGRP_MLME, GFP_KERNEL);
+ 	return;
+=20
+  nla_put_failure:
+ 	nlmsg_free(msg);
+ }
+=20
+ void nl80211_st_done(struct cfg80211_registered_device *rdev,
+ 		     struct net_device *dev)
+ {
+ 	struct wireless_dev *wdev =3D dev->ieee80211_ptr;
+ 	struct nlattr *nested;
+ 	struct sk_buff *msg;
+ 	void *hdr;
+ 	int i =3D 1;
+=20
+ 	msg =3D nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+ 	if (!msg)
+ 		return;
+=20
+ 	hdr =3D nl80211hdr_put(msg, 0, 0, 0,
+ 			     NL80211_CMD_COMPLETED_SMD_TRANSITION);
+ 	if (!hdr) {
+ 		nlmsg_free(msg);
+ 		return;
+ 	}
+=20
+ 	if (nla_put_u32(msg, NL80211_ATTR_WIPHY, rdev->wiphy_idx) ||
+ 	    nla_put_u32(msg, NL80211_ATTR_IFINDEX, dev->ifindex) ||
+ 	    nla_put(msg, NL80211_ATTR_MLD_ADDR, ETH_ALEN,
+ 		    wdev->u.client.connected_addr))
+ 		goto nla_put_failure;
+=20
+ 	nested =3D nla_nest_start(msg, NL80211_ATTR_MLO_LINKS);
+ 	if (!nested)
+ 		goto nla_put_failure;
+=20
+ 	for (unsigned int link =3D 0; link < IEEE80211_MLD_MAX_NUM_LINKS; link++=
) {
+ 		struct cfg80211_internal_bss *bss;
+ 		struct nlattr *nested_mlo_links;
+=20
+ 		if (!(wdev->valid_links & BIT(link)))
+ 			continue;
+=20
+ 		bss =3D wdev->links[link].client.current_bss;
+ 		if (WARN_ON(!bss))
+ 			continue;
+=20
+ 		nested_mlo_links =3D nla_nest_start(msg, i);
+ 		if (!nested_mlo_links)
+ 			goto nla_put_failure;
+=20
+ 		if (nla_put_u8(msg, NL80211_ATTR_MLO_LINK_ID, link) ||
+ 		    nla_put(msg, NL80211_ATTR_BSSID, ETH_ALEN, bss->pub.bssid) ||
+ 		    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN,
+ 			    wdev->links[link].addr))
+ 			goto nla_put_failure;
+=20
+ 		nla_nest_end(msg, nested_mlo_links);
+ 		i++;
+ 	}
+ 	nla_nest_end(msg, nested);
+=20
+ 	genlmsg_end(msg, hdr);
+=20
+ 	genlmsg_multicast_netns(&nl80211_fam, wiphy_net(&rdev->wiphy), msg, 0,
+ 				NL80211_MCGRP_MLME, GFP_KERNEL);
+ 	return;
+=20
+  nla_put_failure:
+ 	nlmsg_free(msg);
+ }
+=20
  void nl80211_send_ibss_bssid(struct cfg80211_registered_device *rdev,
  			     struct net_device *netdev, const u8 *bssid,
  			     gfp_t gfp)

--CPq2Hg4wAwSJn/22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzcdEACgkQJNaLcl1U
h9DA4wf9ErtQjQjW12NZywQMvV3/ztYKmlc8ri+Qnf41PzG3Ov55uoPJZGIhj1ok
17W3aamG+LGOD5/FB+u6lmcTtV687+QqFNgODX7LUbxFV0H+DY2bmg1CuExmKijC
/OruZmTbSdbYth88YlTWcc1NgTTUQpFbxwQeLntXTk8vUs7ZXLZKBJuduiLaxE96
hPb+J+LfaQvNCsWzTfcDomPfZgOz4H8IIkJcY4CfjWhqgvLlQyIWCMLzT9H05Tm6
Vr8oU0nkbx1pEq4vPkkxpD4vrzr+VfwmSKKTShbJAaeSdfPUgfRQiTghIdN8sY+A
/xpUzmYyoLsgxUrmWub2bvBwMy6C6g==
=Q8fh
-----END PGP SIGNATURE-----

--CPq2Hg4wAwSJn/22--
