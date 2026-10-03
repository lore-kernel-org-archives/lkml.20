Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3B43AFCF2
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023345; cv=none; b=rTTIRwfbsCoIssVGac9uk9dKQcwMTInUK0j3aGvqyBoBuT3xHXo+6jU1mskU6arUwGDJgXIB8wlT2icYw/SCV0X0ltQ1AdY2aELbxBqZUtzLjfwWc/sfEwa5GUJS7H/j9FFO28Dg0Qmlq3ytM3PEnkm7Av+oc/IiP13AAgWJPWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023345; c=relaxed/simple;
	bh=nRNW6PX90Brx7ozdIXSOfc3Npjc6q+q4Q4ePhG71tfA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QdezTIrhyOfU3kXaK6sbdmV10cfyWArbd6IgWsQs/7/m+Vp7YouPDMS9Xf5mkv5SdlpKFPzguvc9aYAbZaELn+X9T3VKizzW9Ni7bGf8P7qPH8mx1gvN4PcWdzkQdxTY3IXbgNhzWz6m0IWaYgKLjp7Xn2n3sPlJAK8VjR+Y7fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8223f4fb134so921624a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023342; x=1791628142;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LaSCKOLltpWSEuJE1ROAWBhao/xP+KhXsDuaM+jedDQ=;
        b=npaOvcL/5D8JdrgFFQsxWcFVO9sCD6gflWxd9zlpEBAllYniehIEVgar3ZlPZtapD2
         Tx+WEhEru4Igs6CNaE1/oPCFY6c4AsBcb9PlMwBV7ReJpEt6t00Jf+eFc7KkMpySLsTE
         ARTT5bRQLdi+p3MQBTZIRrKGaycjffur009ziDjcIDEDiZW3hqirDKXoZVRzvtpnSdUJ
         iAFWIOkMZuz9IncsbZFjYYcSMqH5nAU5qYK3zaiuKkZcopu+wqrn5iM2ZmwZ8tVP2snG
         xLLWdSW4EkBmteuYr9NSq0LUv4BNKAA8R5R63HswiVZg0cow4n/Q60EKV0oJzO3S+E3Z
         E8vQ==
X-Gm-Message-State: AFuF++n856y7ifHNsKumqLQM2VLAbpC4RMtX9+yekJACjRoamI4esmFE
	dtfxi/f4EhLlszAS6st7Wk5nFUgkTuexOaZdvl5uOeJGRi5k8y99M3pv5q6su+B+ZZ5JH9TOLHl
	UyLK/pfniH8Grdck7DSkMPZs2TDw4lTqb2+2zMCBJ8LQKXhLo8XjxraqeOUA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c110:b0:4d5:291b:b850 with SMTP id
 5614622812f47-4f67b648c89mr2020021b6e.54.1791023342570; Sat, 03 Oct 2026
 03:29:02 -0700 (PDT)
Date: Sat, 03 Oct 2026 03:29:02 -0700
In-Reply-To: <20261003101247.876-1-rajojha047@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0d8ee.9ad129c8.3858c0.0011.GAE@google.com>
Subject: Re: [syzbot] WARNING in wiphy_delayed_work_cancel
From: syzbot <syzbot+e9cbd080a7801f06cf08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, rajojha047@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

an_adv: batadv0: The MTU of interface batadv_slave_1 is too small (1500) to=
 handle the transport of batman-adv packets. Packets going over this interf=
ace will be fragmented on layer2 which could impact the performance. Settin=
g the MTU to 1532 would solve the problem.
[   62.793102][ T5864] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   62.814915][ T5864] hsr_slave_0: entered promiscuous mode
[   62.815489][ T5864] hsr_slave_1: entered promiscuous mode
[   62.815842][ T5864] debugfs: 'hsr0' already exists in 'hsr'
[   62.815935][ T5864] Cannot create hsr debugfs directory
[   64.359905][   T67] Bluetooth: hci0: command tx timeout
[   65.513797][ T5837] bridge_slave_1: left allmulticast mode
[   65.513852][ T5837] bridge_slave_1: left promiscuous mode
[   65.515345][ T5837] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   65.527936][ T5837] bridge_slave_0: left allmulticast mode
[   65.527953][ T5837] bridge_slave_0: left promiscuous mode
[   65.528170][ T5837] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   65.590137][   T43] kauditd_printk_skb: 20 callbacks suppressed
[   65.590156][   T43] audit: type=3D1400 audit(1791023292.018:189): avc:  =
denied  { write } for  pid=3D5883 comm=3D"dhcpcd-run-hook" name=3D"hook-sta=
te" dev=3D"tmpfs" ino=3D1839 scontext=3Dsystem_u:system_r:dhcpc_t tcontext=
=3Dsystem_u:object_r:tmpfs_t tclass=3Ddir permissive=3D1
[   65.590377][   T43] audit: type=3D1400 audit(1791023292.018:190): avc:  =
denied  { create } for  pid=3D5883 comm=3D"dhcpcd-run-hook" name=3D"resolv.=
conf.eth2.link" scontext=3Dsystem_u:system_r:dhcpc_t tcontext=3Dsystem_u:ob=
ject_r:tmpfs_t tclass=3Dfile permissive=3D1
[   65.590877][   T43] audit: type=3D1400 audit(1791023292.018:191): avc:  =
denied  { write } for  pid=3D5883 comm=3D"dhcpcd-run-hook" path=3D"/run/dhc=
pcd/hook-state/resolv.conf.eth2.link" dev=3D"tmpfs" ino=3D2013 scontext=3Ds=
ystem_u:system_r:dhcpc_t tcontext=3Dsystem_u:object_r:tmpfs_t tclass=3Dfile=
 permissive=3D1
[   65.591303][   T43] audit: type=3D1400 audit(1791023292.018:192): avc:  =
denied  { append } for  pid=3D5883 comm=3D"dhcpcd-run-hook" name=3D"resolv.=
conf.eth2.link" dev=3D"tmpfs" ino=3D2013 scontext=3Dsystem_u:system_r:dhcpc=
_t tcontext=3Dsystem_u:object_r:tmpfs_t tclass=3Dfile permissive=3D1
[   65.649792][   T43] audit: type=3D1400 audit(1791023292.078:193): avc:  =
denied  { write } for  pid=3D5886 comm=3D"rm" name=3D"hook-state" dev=3D"tm=
pfs" ino=3D1839 scontext=3Dsystem_u:system_r:dhcpc_t tcontext=3Dsystem_u:ob=
ject_r:tmpfs_t tclass=3Ddir permissive=3D1
[   65.649931][   T43] audit: type=3D1400 audit(1791023292.078:194): avc:  =
denied  { unlink } for  pid=3D5886 comm=3D"rm" name=3D"resolv.conf.eth2.lin=
k" dev=3D"tmpfs" ino=3D2013 scontext=3Dsystem_u:system_r:dhcpc_t tcontext=
=3Dsystem_u:object_r:tmpfs_t tclass=3Dfile permissive=3D1
[   65.662713][ T5837] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   65.685485][ T5837] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   65.686538][ T5837] bond0 (unregistering): Released all slaves
[   65.733369][ T5441] 8021q: adding VLAN 0 to HW filter on device eth2
[   65.763611][ T5837] hsr_slave_0: left promiscuous mode
[   65.764176][ T5837] hsr_slave_1: left promiscuous mode
[   65.764872][ T5837] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   65.764895][ T5837] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   65.765793][ T5837] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   65.765807][ T5837] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   65.776211][ T5837] veth1_macvtap: left promiscuous mode
[   65.776258][ T5837] veth0_macvtap: left promiscuous mode
[   65.776383][ T5837] veth1_vlan: left promiscuous mode
[   65.776449][ T5837] veth0_vlan: left promiscuous mode
[   65.995161][ T5837] team0 (unregistering): Port device team_slave_1 remo=
ved
[   66.010657][ T5837] team0 (unregistering): Port device team_slave_0 remo=
ved
[   66.242707][   T43] audit: type=3D1400 audit(1791023292.668:195): avc:  =
denied  { write } for  pid=3D5889 comm=3D"dhcpcd-run-hook" name=3D"hook-sta=
te" dev=3D"tmpfs" ino=3D1839 scontext=3Dsystem_u:system_r:dhcpc_t tcontext=
=3Dsystem_u:object_r:tmpfs_t tclass=3Ddir permissive=3D1
[   66.318339][   T43] audit: type=3D1400 audit(1791023292.738:196): avc:  =
denied  { write } for  pid=3D5892 comm=3D"rm" name=3D"hook-state" dev=3D"tm=
pfs" ino=3D1839 scontext=3Dsystem_u:system_r:dhcpc_t tcontext=3Dsystem_u:ob=
ject_r:tmpfs_t tclass=3Ddir permissive=3D1
[   66.439075][   T67] Bluetooth: hci0: command tx timeout
[   66.439466][ T5864] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   66.442488][ T5864] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m0
[   66.443164][ T5864] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   66.444629][ T5864] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m1
[   66.445152][ T5864] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   66.447862][ T5864] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m2
[   66.448537][ T5864] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   66.455828][ T5864] 8021q: adding VLAN 0 to HW filter on device netdevsi=
m3
[   66.458030][   T43] audit: type=3D1400 audit(1791023292.878:197): avc:  =
denied  { write } for  pid=3D5895 comm=3D"dhcpcd-run-hook" name=3D"hook-sta=
te" dev=3D"tmpfs" ino=3D1839 scontext=3Dsystem_u:system_r:dhcpc_t tcontext=
=3Dsystem_u:object_r:tmpfs_t tclass=3Ddir permissive=3D1
[   66.525202][   T43] audit: type=3D1400 audit(1791023292.948:198): avc:  =
denied  { write } for  pid=3D5905 comm=3D"rm" name=3D"hook-state" dev=3D"tm=
pfs" ino=3D1839 scontext=3Dsystem_u:system_r:dhcpc_t tcontext=3Dsystem_u:ob=
ject_r:tmpfs_t tclass=3Ddir permissive=3D1
[   66.543482][ T5864] 8021q: adding VLAN 0 to HW filter on device bond0
[   66.563932][ T5864] 8021q: adding VLAN 0 to HW filter on device team0
[   66.570011][  T209] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   66.570091][  T209] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   66.579873][  T209] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   66.579960][  T209] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   66.879344][ T5864] 8021q: adding VLAN 0 to HW filter on device batadv0
[   66.922063][ T5864] veth0_vlan: entered promiscuous mode
[   66.928641][ T5864] veth1_vlan: entered promiscuous mode
[   66.962353][ T5864] veth0_macvtap: entered promiscuous mode
[   66.964951][ T5864] veth1_macvtap: entered promiscuous mode
[   66.973999][ T5864] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   66.978182][ T5864] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   67.009928][ T5754] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.043791][   T62] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   67.043805][   T62] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   67.049131][ T5837] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.072199][   T62] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   67.072217][   T62] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   67.079714][ T5837] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.090038][ T5754] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.666773][ T5754]=20
[   67.667906][ T5754] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[   67.670864][ T5754] WARNING: possible recursive locking detected
[   67.673721][ T5754] syzkaller #0 Not tainted
[   67.675241][ T5754] --------------------------------------------
[   67.677627][ T5754] kworker/u32:2/5754 is trying to acquire lock:
[   67.680230][ T5754] ffff8880539b0800 (&rdev->wiphy.mtx){+.+.}-{4:4}, at:=
 ieee80211_uninit+0x104/0x2e0
[   67.684005][ T5754]=20
[   67.684005][ T5754] but task is already holding lock:
[   67.687170][ T5754] ffff8880539b0800 (&rdev->wiphy.mtx){+.+.}-{4:4}, at:=
 ieee80211_remove_interfaces+0xf0/0x6e0
[   67.691869][ T5754]=20
[   67.691869][ T5754] other info that might help us debug this:
[   67.695164][ T5754]  Possible unsafe locking scenario:
[   67.695164][ T5754]=20
[   67.698279][ T5754]        CPU0
[   67.699702][ T5754]        ----
[   67.701072][ T5754]   lock(&rdev->wiphy.mtx);
[   67.702958][ T5754]   lock(&rdev->wiphy.mtx);
[   67.704806][ T5754]=20
[   67.704806][ T5754]  *** DEADLOCK ***
[   67.704806][ T5754]=20
[   67.708010][ T5754]  May be due to missing lock nesting notation
[   67.708010][ T5754]=20
[   67.710898][ T5754] locks held by kworker/u32:2/5754: 5, last CPU#3:
[   67.713491][ T5754]  #0: ffff88801d6a7140 ((wq_completion)netns){+.+.}-{=
0:0}, at: process_one_work+0x1466/0x1b10
[   67.717245][ T5754]  #1: ffffc90003e3fd08 (net_cleanup_work){+.+.}-{0:0}=
, at: process_one_work+0xa2c/0x1b10
[   67.721603][ T5754]  #2: ffffffff90cbbfa8 (pernet_ops_rwsem){++++}-{4:4}=
, at: cleanup_net+0xb8/0x920
[   67.727220][ T5754]  #3: ffffffff90cd4b00 (rtnl_mutex){+.+.}-{4:4}, at: =
ieee80211_unregister_hw+0x4d/0x360
[   67.731071][ T5754]  #4: ffff8880539b0800 (&rdev->wiphy.mtx){+.+.}-{4:4}=
, at: ieee80211_remove_interfaces+0xf0/0x6e0
[   67.734602][ T5754]=20
[   67.734602][ T5754] stack backtrace:
[   67.736954][ T5754] CPU: 3 UID: 0 PID: 5754 Comm: kworker/u32:2 Not tain=
ted syzkaller #0 PREEMPT(full)=20
[   67.740313][ T5754] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   67.744149][ T5754] Workqueue: netns cleanup_net
[   67.745929][ T5754] Call Trace:
[   67.747399][ T5754]  <TASK>
[   67.748493][ T5754]  dump_stack_lvl+0x100/0x190
[   67.750079][ T5754]  print_deadlock_bug.cold+0xbd/0xca
[   67.751840][ T5754]  __lock_acquire+0x13f4/0x1f40
[   67.753682][ T5754]  lock_acquire+0x1d1/0x380
[   67.755394][ T5754]  ? ieee80211_uninit+0x104/0x2e0
[   67.757427][ T5754]  ? __pfx___might_resched+0x10/0x10
[   67.759654][ T5754]  __mutex_lock+0x1a4/0x1bd0
[   67.761548][ T5754]  ? ieee80211_uninit+0x104/0x2e0
[   67.763313][ T5754]  ? ieee80211_uninit+0x104/0x2e0
[   67.765265][ T5754]  ? ib_device_get_by_netdev+0x1a8/0x530
[   67.767507][ T5754]  ? __pfx___mutex_lock+0x10/0x10
[   67.769502][ T5754]  ? vxlan_netdevice_event+0x11f/0x370
[   67.771717][ T5754]  ? __pfx_ib_device_get_by_netdev+0x10/0x10
[   67.774156][ T5754]  ? __sanitizer_cov_trace_switch+0x54/0x90
[   67.776825][ T5754]  ? __pfx_vxlan_netdevice_event+0x10/0x10
[   67.779316][ T5754]  ? ip6_route_dev_notify+0xe4/0x750
[   67.782010][ T5754]  ? ndisc_netdev_event+0xa1/0x560
[   67.784532][ T5754]  ? ieee80211_uninit+0x104/0x2e0
[   67.787098][ T5754]  ? rtnl_is_locked+0x15/0x20
[   67.789325][ T5754]  ieee80211_uninit+0x104/0x2e0
[   67.791104][ T5754]  ? __pfx_ieee80211_uninit+0x10/0x10
[   67.792953][ T5754]  unregister_netdevice_many_notify+0x1407/0x2150
[   67.794957][ T5754]  ? __pfx_unregister_netdevice_many_notify+0x10/0x10
[   67.797525][ T5754]  ? rcu_is_watching+0x13/0xc0
[   67.799462][ T5754]  unregister_netdevice_queue+0x30b/0x3c0
[   67.801666][ T5754]  ? kernfs_remove_by_name_ns+0x103/0x120
[   67.803902][ T5754]  ? __pfx_unregister_netdevice_queue+0x10/0x10
[   67.806383][ T5754]  _cfg80211_unregister_wdev+0x66e/0x830
[   67.808647][ T5754]  ieee80211_remove_interfaces+0x34e/0x6e0
[   67.811148][ T5754]  ? __pfx_ieee80211_remove_interfaces+0x10/0x10
[   67.813691][ T5754]  ieee80211_unregister_hw+0x55/0x360
[   67.815846][ T5754]  hwsim_exit_net+0x891/0x1500
[   67.818006][ T5754]  ? __pfx_hwsim_exit_net+0x10/0x10
[   67.821567][ T5754]  ? __pfx___might_resched+0x10/0x10
[   67.823580][ T5754]  ? ip_vs_sync_net_cleanup+0x84/0x90
[   67.825315][ T5754]  ? __ip_vs_dev_cleanup_batch+0x21e/0x2a0
[   67.827144][ T5754]  ? __pfx_hwsim_exit_net+0x10/0x10
[   67.828885][ T5754]  ops_undo_list+0x2ee/0xab0
[   67.830799][ T5754]  ? __pfx_ops_undo_list+0x10/0x10
[   67.832972][ T5754]  ? cleanup_net+0x332/0x920
[   67.834812][ T5754]  ? idr_destroy+0x62/0x2e0
[   67.836747][ T5754]  cleanup_net+0x499/0x920
[   67.838833][ T5754]  ? __pfx_cleanup_net+0x10/0x10
[   67.840948][ T5754]  ? process_one_work+0xa2c/0x1b10
[   67.843529][ T5754]  ? process_one_work+0x906/0x1b10
[   67.846421][ T5754]  process_one_work+0xac7/0x1b10
[   67.849247][ T5754]  ? __pfx_process_one_work+0x10/0x10
[   67.851637][ T5754]  ? lock_acquire+0x1d1/0x380
[   67.853690][ T5754]  ? __pfx_cleanup_net+0x10/0x10
[   67.856016][ T5754]  worker_thread+0x5ef/0xe50
[   67.858043][ T5754]  ? kthread+0x13a/0x450
[   67.859721][ T5754]  ? __pfx_worker_thread+0x10/0x10
[   67.861571][ T5754]  kthread+0x373/0x450
[   67.862940][ T5754]  ? __pfx_kthread+0x10/0x10
[   67.864501][ T5754]  ret_from_fork+0x730/0xd60
[   67.866036][ T5754]  ? __pfx_ret_from_fork+0x10/0x10
[   67.867762][ T5754]  ? __switch_to+0x800/0x10f0
[   67.869425][ T5754]  ? __pfx_kthread+0x10/0x10
[   67.871349][ T5754]  ret_from_fork_asm+0x1a/0x30
[   67.873464][ T5754]  </TASK>
[   71.389794][ T1440] ieee802154 phy0 wpan0: encryption failed: -22
[   71.389822][ T1440] ieee802154 phy1 wpan1: encryption failed: -22
[   76.509494][   T10] cfg80211: failed to load regulatory.db


syzkaller build log:
go env (err=3D<nil>)
AR=3D'ar'
CC=3D'gcc'
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_ENABLED=3D'1'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
CXX=3D'g++'
GCCGO=3D'gccgo'
GO111MODULE=3D'auto'
GOAMD64=3D'v1'
GOARCH=3D'amd64'
GOAUTH=3D'netrc'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOCACHEPROG=3D''
GODEBUG=3D''
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFIPS140=3D'off'
GOFLAGS=3D''
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build1444367985=3D/tmp/go-build -gno-record-gc=
c-switches'
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mo=
d'
GOMODCACHE=3D'/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.26.0'
GOWORK=3D''
PKG_CONFIG=3D'pkg-config'

git status (err=3D<nil>)
HEAD detached at 1e72964b011
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D1e72964b0111319984575e60f266d1fa0a98abb5 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260817-123423"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D1e72964b0111319984575e60f266d1fa0a98abb5 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260817-123423"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D1e72964b0111319984575e60f266d1fa0a98abb5 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260817-123423"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"1e72964b0111319984575e60f266d1fa0a=
98abb5\"
/usr/bin/ld: /tmp/ccQDOckT.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D12265725580000


Tested on:

commit:         e767a4ea Merge tag 'probes-fixes-v7.3-rc5' of git://gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D929e4854a828f43=
4
dashboard link: https://syzkaller.appspot.com/bug?extid=3De9cbd080a7801f06c=
f08
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D16f92ec95800=
00

