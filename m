Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794124864;
	b=L4WHB6jlftjG+6xJwNQkVqSeN/c7/BqO5QqiTVIYbjA6HIEp7uCDrRIWqvdpoQmFO8ID
	 1SA7djk8wjjNdgFnVJOhWv0KhEBSqZNpHZwlu/8THLcjw/xugAeEN7IDQiJYvoXKqGt1m
	 tPkXqPC8TeYWtt6HBL3KjU2y1wEyYVXWmLEdEsxlp3ep5Cd7/NXKLgf/4BuRLgD3si4sM
	 YT246c9o5v8vzCcywNh3r8jgHCO5tTGbmDSbtckjhPSWb/bkVWVieb+2cFbJUwncKxyLP
	 mehji4ff9hEtOfY6UDACMnKk1UOkl9cjo/vqgrplWAvFRpjJnSbpMPWhaHchMbmFI9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124864;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type:Content-Transfer-Encoding;
	bh=J88EOnTp6DDyQWMN+uJw6KY8yryRm72G2AQk7g82/uM=;
	b=mUDSC46mx8/mtHgkKT9fzySPDpiDCJFmlL2hlMo3v5HbKXeYWEgbC/CpolS947KDkOmH
	 uLd8MgpY4bZ9cS2nu/InvFJH15ErMXXjJoyzZ63Y0gFoK7WWegGi5yKU2UAfnXPr9ElQA
	 NxBkXsYQGvi1DzbdEBAmTPq9+tf3QJZNuLjq8dDCTQ02tMGni1g8p6PvjYnDxD7gcdpR+
	 VJ3pUeLrhH/Ay9hlMTu+5n2EI+y/zfQnAkIh5vyxPJ6FIcZQ1x/LDURJFFVUleV5Fk4Bb
	 nSfj7Ym+e2D52V+mscvfZxoILdXGJ5UCkKQq8GojdhCSPLbNY2SWUtXMj5MKw5D746Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42CB606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42CB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f8281066c4so321312b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124863; x=1794729663;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J88EOnTp6DDyQWMN+uJw6KY8yryRm72G2AQk7g82/uM=;
        b=pp8EyYetiUbiUGw5mVySEUqDshu4e+fSWnk/qCXpdia+5Pb4tmwZP+6xsEv3iTc5+Z
         Xv9VvBkOQ+DCl81r5YqMu0srK5FXP7/mBkCo8+mV8ONN/3hWFcIqCYUofF4zB7eRqXhF
         +3aHFgq7/qER3x+o9ylcisT6ntKWo4gIX8GF7fq5WJaiRWFhD6br8cjMsDjcIrEPZSfD
         ol/bkYt4rNYAT21ai7XYD4qcFJxcVKREpjiFgkk60hM/v5BgmVOyi6eVr7Scc4GGvPz3
         HlZ/b90LaxQQrKItSuNEkW7K9rumIycesC0kYsD0tMOORZhMUxUfS7c81nFSlKoCPTTm
         QaMA==
X-Forwarded-Encrypted: i=1; AKwUvByhf/fv5e1CBEJgVdp3tHfhrRQLbTYe/pcbnbIUxZSrHy6XK4hvAvRGZpGhHIohwErldnpYnGm6LwrL4oI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CKQJ83dI+xzIHoxhXj5CkZUcKTGsrvKU4adMH1p7+RELMZMMh
	4NJoqf9HesqTpAINwTsI/aEsD5QLj2S6A6a6FfYsUOykoAPLjMQMNGtOvH2rjliy/d9p7WNFtwh
	6tNmnICZe5X3lDCvgMGJBr5j1xF1Jagq0Vj5pN71N3Ps9C5YCl221DHkCnnI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2389:b0:4e0:1d24:cec1 with SMTP id
 5614622812f47-568143748bfmr467480b6e.5.1794124862848; Sun, 08 Nov 2026
 00:01:02 -0800 (PST)
Date: Sun, 08 Nov 2026 00:01:02 -0800
In-Reply-To: <2056587.PYKUYFuaPT@sven-l14>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af02c3e.4dd4714a.f8d02.000e.GAE@google.com>
Subject: Re: [syzbot] [arm?] BUG: workqueue lockup in batadv_tt_purge
From: syzbot <syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com>
To: antonio@mandelbit.com, b.a.t.m.a.n@lists.open-mesh.org, 
	davem@davemloft.net, linux-kernel@vger.kernel.org, marek.lindner@mailbox.org, 
	netdev@vger.kernel.org, omermetekaya0@gmail.com, sven@narfation.org, 
	sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering=
 an issue:
BUG: workqueue lockup in nsim_fib_event_work

bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth1_to_bridge with own address as source addr=
ess (addr:aa:aa:aa:aa:aa:0c, vlan:0)
BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 stuck f=
or 34s!
Showing busy workqueues and worker pools:
workqueue events: flags=3D0x100
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D4 refcnt=3D5
    pending: nsim_dev_hwstats_traffic_work, vmstat_shepherd, 2*ovs_dp_masks=
_rebalance
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D33 refcnt=3D34
    in-flight: 26:nsim_fib_event_work for 35s nsim_fib_event_work ,4951:nsi=
m_fib_event_work for 31s ,1503:nsim_fib_event_work for 22s ,1091:nsim_fib_e=
vent_work for 15s
    pending: 3*nsim_dev_hwstats_traffic_work, 2*ovs_dp_masks_rebalance, psi=
_avgs_work, 3*ovs_dp_masks_rebalance, psi_avgs_work, drm_fb_helper_damage_w=
ork, 2*l2cap_info_timeout, psi_avgs_work, 2*l2cap_info_timeout, 4*ovs_dp_ma=
sks_rebalance, 3*rht_deferred_worker, psi_avgs_work, reg_todo, 3*nsim_fib_e=
vent_work
workqueue events_unbound: flags=3D0x2
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D5 refcnt=3D6
    in-flight: 14:nsim_dev_trap_report_work for 5s
    pending: 2*nsim_dev_trap_report_work, toggle_allocation_gate, flush_mem=
cg_stats_dwork
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D15 refcnt=3D16
    in-flight: 5376:cfg80211_wiphy_work for 25s cfg80211_wiphy_work ,1178:c=
fg80211_wiphy_work for 32s cfg80211_wiphy_work ,1372:cfg80211_wiphy_work fo=
r 35s cfg80211_wiphy_work ,5377:nsim_dev_trap_report_work for 7s ,58:cfg802=
11_wiphy_work for 33s cfg80211_wiphy_work ,49:cfg80211_wiphy_work for 23s c=
fg80211_wiphy_work ,40:cfg80211_wiphy_work for 31s cfg80211_wiphy_work
    pending: 2*macvlan_process_broadcast
workqueue events_power_efficient: flags=3D0x82
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D4 refcnt=3D5
    pending: fb_flashcursor, wg_ratelimiter_gc_entries, 2*neigh_managed_wor=
k
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D3 refcnt=3D4
    in-flight: 1350:gc_worker for 16s ,144:neigh_periodic_work for 20s
    pending: do_cache_clean
workqueue events_dfl_long: flags=3D0x2
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D11 refcnt=3D12
    pending: 11*defense_work_handler
workqueue netns: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D4
    in-flight: 12:cleanup_net for 36s
workqueue mm_percpu_wq: flags=3D0x108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: vmstat_update
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: vmstat_update
workqueue writeback: flags=3D0x4a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D4 MAYDAY
    in-flight: 33(RESCUER):wb_workfn for 31s
workqueue mld: flags=3D0x40108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D4
    pending: mld_dad_work
    inactive: 2*mld_dad_work
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D108
    pending: mld_dad_work
    inactive: mld_dad_work, 8*mld_ifc_work, 4*mld_dad_work, mld_ifc_work, m=
ld_dad_work, 10*mld_ifc_work, mld_dad_work, 3*mld_ifc_work, mld_dad_work, 1=
1*mld_ifc_work, mld_dad_work, mld_ifc_work, mld_dad_work, mld_ifc_work, 3*m=
ld_dad_work, 10*mld_ifc_work, 3*mld_dad_work, 7*mld_ifc_work, 2*mld_dad_wor=
k, 3*mld_ifc_work, mld_dad_work, mld_ifc_work, mld_dad_work, mld_ifc_work, =
mld_dad_work, mld_ifc_work, mld_dad_work, 17*mld_ifc_work, mld_dad_work, 3*=
mld_ifc_work, 5*mld_dad_work
workqueue ipv6_addrconf: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D248 MAYDAY
    in-flight: 2822(RESCUER):addrconf_dad_work for 0s
    pending: mayday_cursor_func
    inactive: 242*addrconf_dad_work
workqueue bat_events: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D50 MAYDAY
    in-flight: 2854(RESCUER):batadv_dat_purge for 7s
    inactive: batadv_bla_periodic_work, batadv_dat_purge, batadv_bla_period=
ic_work, batadv_dat_purge, batadv_bla_periodic_work, batadv_dat_purge, bata=
dv_bla_periodic_work, batadv_dat_purge, batadv_bla_periodic_work, batadv_iv=
_send_outstanding_bat_ogm_packet, batadv_mcast_mla_update, 4*batadv_iv_send=
_outstanding_bat_ogm_packet, batadv_purge_orig, 2*batadv_iv_send_outstandin=
g_bat_ogm_packet, 4*batadv_purge_orig, 4*batadv_iv_send_outstanding_bat_ogm=
_packet, 2*batadv_tt_purge, 4*batadv_iv_send_outstanding_bat_ogm_packet, 3*=
batadv_tt_purge, batadv_mcast_mla_update, batadv_purge_orig, batadv_iv_send=
_outstanding_bat_ogm_packet, batadv_tt_purge, 4*batadv_mcast_mla_update, ba=
tadv_dat_purge
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker
workqueue wg-kex-wg1: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 4767:wg_packet_handshake_receive_worker for 21s
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 932:wg_packet_decrypt_worker for 22s
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_encrypt_worker, wg_packet_decrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg2: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_encrypt_worker, wg_packet_decrypt_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    in-flight: 4813:wg_packet_encrypt_worker for 14s
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
workqueue wg-kex-wg1: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_encrypt_worker, wg_packet_decrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_encrypt_worker, wg_packet_decrypt_worker, wg_packet_=
tx_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_encrypt_worker, wg_packet_decrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker
pool 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 hung=3D14s workers=3D6 idle:=
 4847 9 10
pool 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D34s workers=3D9 idle:=
 24 4738 5269 5303 4950
pool 8: cpus=3D0-1 flags=3D0x6 nice=3D0 hung=3D0s workers=3D12 manager: 537=
8
Showing backtraces of busy workers in stalled worker pools:
pool 6:
task:kworker/1:1     state:R  running task     stack:0     pid:26    tgid:2=
6    ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: events nsim_fib_event_work
Call trace:


Tested on:

commit:         532df11b batman-adv: tt: batch BH re-enable during TT ..
git tree:       https://git.open-mesh.org/batadv.git disable-bh
console output: https://syzkaller.appspot.com/x/log.txt?x=3D137967a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da3c0ea8c3fd7635=
3
dashboard link: https://syzkaller.appspot.com/bug?extid=3D61b202fdc410840f0=
198
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64

Note: no patches were applied.
