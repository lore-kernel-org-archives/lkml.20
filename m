Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793186117;
	b=LeVbmWJHx0Cz9uPe7HF7QPcI13RD21bzBiNn8IuAHn53AODWWQ9H8T5k/VX2JdIWTjKs
	 L2z8OQtQYisUNrhgIzb9l1t6CHwtv7SU6G3WLF6Gw+5NMKH0Wjntvgy+YxRQxuowW8A4c
	 z9wNC+d1ZC4njMdPYehICgkgkjpAFsLFBSrTa/DLR2CxR9B3SgK02Ahp7u630vfjKUfgu
	 GhQCVXNVLl07VKj2H3wvTxmSCCeB8fwT0lJqbSxKQFoMncj+tQgmACmwx4uwE7NIQsuC7
	 0RHwkan2YH6PnBeZ1hGCwCH2yV65/ffpM6r9Ku5R48461bwqf5DUW2M3giPXBLbcRhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
	b=oGW7RFDxoPnGb5yj9TlKMhBFcJyTbNLOg18FrEJo8SRoSQ6XRsAKH2yxRYufFKCGLG2I
	 YsrbCqxeNo7aUHLqHOvVC5jzyp7FSFX1YiMA9ikDi5hlADG2iV+427EjrMmkh5LKfJGMQ
	 EF7Xwkd0YRUTjDpzDEkC3+hJGBtKJ05gUk79o4S3OgXn0RYnIlz5IRViHUckKAaJCLkf4
	 1f9KEqg8R9H8CdA88q8HrfSJ+s9d1A09RHEKuzcmQ9Ok9AwL+3UfYPa54GpXBR14z6bcj
	 0oNYsSWss8k4Wuk6zrvi9Cc2U73lor1zLw6fLsfj64VZjokrZXaj9RHhmVhYst4LK5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzQIsDwB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D842E606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D842E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzQIsDwB
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3ac4f373d3bso5849821fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793186115; cv=none;
        d=google.com; s=arc-20260327;
        b=ZZ6u7GgII/ttavZI7ryys3M4Duv6ek2WFGhKXAWuh3ZnekRXVMpHuA9v0Uh0e1pUSu
         Qx2ufRumj78deC7wupZgB8ul/Dwibap1gekMVDs5HJeDmn93uH2TmbzKPhAwmVWeiBdR
         ENfjx6qf6vXOrclW5UCiXVxasFHhLD+9tbyTl4brRxztjPidcV9qlXBSylV+VN29TmeO
         saPptkuYg9UDZnux1xQM4hH2kakl6KwxzxWzR5u1hXd3HMODBGBsVpIAoDmwQv2SRSBt
         z7p9hDofP8olWXfc5mltoJrHZPmYh7t8Zw1vceBJLIrhCKO7ODkSLRptY7fCDFlI+Vu4
         RcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
        fh=dGWAYUcHCZZuQ9hhHJkoNCenwo1Rw5k3ncYPMaiVecU=;
        b=ViX0czJfFzPVLWNqjYnfwy7IJq6OHn4+SjDOBkZ/HuxNgwh9mtKV+QpW4AzHNz2uwC
         xu3VCoikVYDh55hPwwxlE6nXRrQYWy/t7MddOvuJ9J8tq0HbMlFZr2m7igRZdbhhle6k
         q2O1stpwujcaS9/mi6GIpCRrCdRGDVgaZA0KlfTN4Rc9Pp5xryqwonxO3dsA8j2MAR0v
         7H1lTiCjMlRojG0+E+u/WtD2D289iFhB59tud4DY+E8pdh/7imhZaHbGBehJdOUIFE9N
         HIToMjl3kSOPD8Dru8DzG54daNy+ETGuOJHQawtoJ7nx6jr+kXLT+Tc1kA1vhI1nTdmU
         /ctw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186115; x=1793790915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
        b=rzQIsDwBwCplstVYmf5uOTdn9PRKLTHQCl4xktYTsC2nDiNY6PdT8wz8JUCpSipCYG
         eqFFyKXB8JR/Z3Te4Ex5Bm7IbzJv3ZJ3ruW+9pqqLXveqoq1708QblL3TWSS6Sltj1ad
         Uwbf3So308mFMpVjzWgeyghzTbvqngqt2gplI/3WQpbfmuXu+pHieXQM99KD+rljsvmb
         f1sK9gYFJ2QyLBmr41jRCS/iGO2ZrNHZWziGAT5sfDHwMSoeppJ7OLcIqHU6dXX7IiQR
         mb1jg+oUcUneR5JfP9ncSKbHIZgEn1S7o51xBdlbry/rZ3h+935BfLUxGItd0rN573ML
         KCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186115; x=1793790915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
        b=UYyK74g5vBRAiMyp7Go7oV4aTMWXgO0invNkq1IOLY+F+tmtA6YjFBbuQlatfs/+zt
         tdRIuGAoMInpSQxSz2UZYxE2TEwKW7S2QmvSFmHaUu3vpeLeTThGRApIRiarhyJdVCmq
         /N1cf45tiEgQnZae67MRf9HFQRPskNbaFkvZRLv487cGKSDq0IWOMNFEXfb6PqQflvDk
         mRGylFOz0SGhoznzi0VKKpqB3rOIGOQ6K4dFgqqYQEsA4CJOUM5Bnw6pQHpfOBGizsvL
         WvHDPNMqEa4LubV1wPFoO6rwTQC08bbvFDyPUnfRIWy7z7+NNM0maNJo++cnsO1KhB3+
         7Epg==
X-Forwarded-Encrypted: i=1; AKwUvBySghupxGDEMLIh8yz1Q3uI9769hp9CCD7cZZWnDWXTHWc/hwf77brB+v6QTX5TYbPuYO6VzjrKJqpLkYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKeIa15MAPqImeMos4z8WqE/EoDRVzagTlfuJ987hoUlMkViH3
	FDqQ7YwH7LPm8gkeDSNVoikrjhtMHp9D8KhOLml8Fi1txfbIgGgNoQag+HK1kJcTZO5R2KUyrsK
	Dp01nE4/rV19CUCC3wz2Yw5MAEpxuj2k=
X-Gm-Gg: AYBFou2BV0rBF+1hbv10RGdQCNmaTw7WT5Kz5g/nthxDsEb8p4A6RLdX2tyRXdky/ne
	60zLxjHafcwRaF11hFv9OkXw/gYwHdJxP2nRQONTHFxjlMaR22vm77IUJ7dkMx/mPQgx9pSf01M
	m0lvaHQNgdqx3l3xRjgMbMzyoKCGZQ0R9fRplq9FEa5rRjxNlu9Z6SibUfqeuM4KzS5x0cAswYg
	ug8LMXKceUInmutL4OGqnav6EjuAM0lHZtIr7qBzL+ERrRHQEAtjxjEYBZy9FMZIYeNykuRCyaT
	ZeNg+6dK87CvMtI6OMXmw/vOBwp+UQ7zL+jcIM/Ym1I8mHRNP/zVDRdrM9iDlb2hlphxGAD/KZH
	t0ODaexg6ZNGQWobLWRviI4aPFcJ2eDMhHvtrTQ==
X-Received: by 2002:a05:6512:401a:b0:5be:50d7:60f with SMTP id
 2adb3069b0e04-5bfcad45638mr900808e87.27.1793186114373; Wed, 28 Oct 2026
 04:15:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027104713.328028-2-bsdhenrymartin@gmail.com> <202610281752.nKGCORKp-lkp@intel.com>
In-Reply-To: <202610281752.nKGCORKp-lkp@intel.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Wed, 28 Oct 2026 19:15:02 +0800
X-Gm-Features: AclHuK-ZGaxYqXYmXJ3b4_5omqV-rK1XApFuPnTHkxfYrM3u6ZjLmyd_d7Xp8AU
Message-ID: <CAEnQdOq52vUT2gw9SeD=Lo0sf9Oesqs=dLCV1yYK2zrfyW6MHQ@mail.gmail.com>
Subject: Re: [PATCH net v4 2/2] vxlan: reject VNI add when the default fdb
 entry is nexthop-backed
To: kernel test robot <lkp@intel.com>
Cc: Ido Schimmel <idosch@nvidia.com>, Ilya Maximets <i.maximets@ovn.org>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Petr Machata <petrm@nvidia.com>, 
	Ferruh Yigit <ferruh.yigit@amd.com>, Antoine Tenart <atenart@redhat.com>, 
	Seungwon Bae <qotmddnjs@gmail.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Build failure confirmed: vxlan->cfg became an RCU-managed pointer in
current net/main, so .cfg.remote_ip no longer compiles.

v5 uses the function-local cfg pointer (&cfg->remote_ip) instead.
[1/2] unchanged, both dry-run applied on net/main, checkpatch clean.

Regards,
Henry

kernel test robot <lkp@intel.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8828=E6=97=
=A5=E5=91=A8=E4=B8=89 17:38=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Henry,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Henry-Martin/vxlan=
-reject-VNI-add-when-the-default-fdb-entry-is-nexthop-backed/20261027-18471=
3
> base:   net/main
> patch link:    https://lore.kernel.org/r/20261027104713.328028-2-bsdhenry=
martin%40gmail.com
> patch subject: [PATCH net v4 2/2] vxlan: reject VNI add when the default =
fdb entry is nexthop-backed
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20261028=
/202610281752.nKGCORKp-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1=
da436a23e613c425fc9b868fc8deb979ede47a4)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261028/202610281752.nKGCORKp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610281752.nKGCORKp-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/net/vxlan/vxlan_vnifilter.c:846:33: error: member reference ty=
pe 'struct vxlan_config *' is a pointer; did you mean to use '->'?
>      846 |             !vxlan_addr_any(&vxlan->cfg.remote_ip)) {
>          |                              ~~~~~~~~~~^
>          |                                        ->
>    1 error generated.
>
>
> vim +846 drivers/net/vxlan/vxlan_vnifilter.c
>
>    819
>    820  static int vxlan_vni_add(struct vxlan_dev *vxlan,
>    821                           struct vxlan_vni_group *vg,
>    822                           u32 vni, union vxlan_addr *group,
>    823                           struct netlink_ext_ack *extack)
>    824  {
>    825          const struct vxlan_config *cfg =3D rtnl_dereference(vxlan=
->cfg);
>    826          struct vxlan_vni_node *vninode;
>    827          __be32 v =3D cpu_to_be32(vni);
>    828          bool changed =3D false;
>    829          int err =3D 0;
>    830
>    831          if (vxlan_vnifilter_lookup(vxlan, v))
>    832                  return vxlan_vni_update(vxlan, vg, v, group, &cha=
nged, extack);
>    833
>    834          err =3D vxlan_vni_in_use(vxlan->net, vxlan, cfg, v);
>    835          if (err) {
>    836                  NL_SET_ERR_MSG(extack, "VNI in use");
>    837                  return err;
>    838          }
>    839
>    840          /* A default fdb entry that is backed by a nexthop group =
can
>    841           * never take a remote; reject before the VNI is installe=
d,
>    842           * otherwise a failure in vxlan_vni_update_group() would =
leave
>    843           * the VNI half-installed.
>    844           */
>    845          if ((group && !vxlan_addr_any(group)) ||
>  > 846              !vxlan_addr_any(&vxlan->cfg.remote_ip)) {
>    847                  if (vxlan_fdb_entry_nh_backed(vxlan, all_zeros_ma=
c, v)) {
>    848                          NL_SET_ERR_MSG(extack,
>    849                                         "Cannot add a remote to a =
nexthop fdb entry");
>    850                          return -EOPNOTSUPP;
>    851                  }
>    852          }
>    853
>    854          vninode =3D vxlan_vni_alloc(vxlan, v);
>    855          if (!vninode)
>    856                  return -ENOMEM;
>    857
>    858          err =3D rhashtable_lookup_insert_fast(&vg->vni_hash,
>    859                                              &vninode->vnode,
>    860                                              vxlan_vni_rht_params)=
;
>    861          if (err) {
>    862                  vxlan_vni_free(vninode);
>    863                  return err;
>    864          }
>    865
>    866          __vxlan_vni_add_list(vxlan, vg, vninode);
>    867
>    868          if (vxlan->dev->flags & IFF_UP)
>    869                  vxlan_vs_add_del_vninode(vxlan, vninode, false);
>    870
>    871          err =3D vxlan_vni_update_group(vxlan, vninode, group, tru=
e, &changed,
>    872                                       extack);
>    873
>    874          vxlan_vnifilter_notify(vxlan, vninode, RTM_NEWTUNNEL);
>    875
>    876          return err;
>    877  }
>    878
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
