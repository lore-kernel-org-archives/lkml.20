Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA03A1E81
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788083601; cv=none; b=LmGnuVvQmNYvCpyxQLGJXwuGU80DEhOiJf69XYdDMGQPD4MCS6KU+G7ataiTyRWLnfhdB14kiyXzAql9F24o3ATSDInysdK1+bgQL3npuOuOB1JtY0CASa02LAB1/1h0DDPjoDhK3FNPW3xrTkyYFXlvVp+vPPXBN7efcNxm5OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788083601; c=relaxed/simple;
	bh=dSxLQWDRW5IAWwKyIICbbnyD+yBhcf/Y21SVweMNJtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UzlcftHKia0+r6wahpqUpW57ShVgTJfMCRZNrbwm5cEvv7A1Z7xZUMRJ5ZPkK4GoDiPERQbHJu4oJoGN7Qab8rBTFLBm5nI5MftTSfAelS8epib2g83FsOBt+AkdT1Xv4D+Z7nyAaMUn3Mjt+VppQqlSqUx+26w9dP6GvnnstM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFDc2Y38; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFDc2Y38"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caced6038eso24789255ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788083599; x=1788688399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JB2xCJsBakoOy/SIVR/TF+TaNRjRpzs1+pmRTReDnc=;
        b=MFDc2Y38FABs6bPT3xC+73csHfzNyUxnI17+BqaqDJnXFOuMSJVivfsA+9NG57f7Hr
         fI+FAbbhv3QgSG/V3iZW239qUZj3ZtFux92QKNJcnpgEBn3nWtC4ZM5LICldTkHZ12s9
         rHORAeajgaROhp7vbHSRG6N8ZK3BGEklDzh7fPX7riNizQ2GU5uDu2IUcepJj0m9bL29
         QlK4ScVlnDGTfjZPj2Or2snZcc0rbYBhVtndz7xJlEjxK2JFpwnoJfUVctL53Z/duu7W
         WySpSN9A99QrD8eerSmB8+lb8NrBh8TQsK2aMpX2oWrvNHVfoWblZDPI3PqtaUf8Anqq
         YRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788083599; x=1788688399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JB2xCJsBakoOy/SIVR/TF+TaNRjRpzs1+pmRTReDnc=;
        b=Izrt7RGhui9S0tirXas86UCUGdIavJQlpkDBUQ1pnXfbO2PsDvsbsVbRXXzHAoau7j
         Q4JfBoN78gC10akR9zmzTcCXEQTksdO4z4/daNMWKqEVjS/0u9LkD6JvUaQbfgc1NaqG
         YX+blRr/zEAOI0GM0oScGRPWQRvzFBaFWQE6mK7b/A1kw3vNxms23Ba7TrVgWfdXorZl
         LdgEidcmuAYunkqR2YVx1X4YcV7tGSTw5GH9qn3b/w1FGQsza785BPd7wOYrtc54QDG6
         zaD31uvG6w9v2rvPOuoJA68CdOHvkpEhUEK2IXw7ybQuER/Wbk8OWQq++kae5P1Tpt+j
         QpLA==
X-Forwarded-Encrypted: i=1; AKwUvBwKuKiO7ioemYyGN/F0I2yTFHh9+APBnhEqytxo+gAvZ2ZeJlR4TVtID5c5SnyIV5RRysw2zeivrKqIgU0=@vger.kernel.org
X-Gm-Message-State: AFuF++lDMMMYTWXhJB3AHizbw3eGRd0Jr2Gp3evH8fUQie/eS+s3sIT6
	PbhCwtsJTCp7WuM+Tr7Z8DFzGD9s5kkJwED6m40o1toFVb41sUXTTXn7
X-Gm-Gg: AYBFou1bnORhbrQgVs5OcT0NIjImthQ3hgLB4tT3/sworKjfEQcw7Ga1bmpd1Q4yCDb
	bqOYtBYw9/h/I45/7Hbrf2m23mf+1m/YL1y8jwOKqRRfsD46SMybNYu7e9m2emQSt7g6J4Cer4+
	5Ofh5RflapvtZDh55eXdvmF1eRme9rulG72XKFPQcMtjgt2RrpF+1lWLp1+egt/oQnld3ggzdyu
	8fFrjFK03v1Q+f9W7upe02YyMJX5guyZgfAb9v0j15kD3LYNNBWgREhqjXgfCeF/FzfU1ovcrL7
	teduHRZNdaOZaN+0HLlYPbgpaRQJ0HIdXfqW/KdHRhVlZa08yPf8UNw71gfKp5V27y6/Ghms90R
	EzPr0yNj5A/iqYYVD4p0uf07GaoWasVJhcIs4yO3ekYFjJ4zg8eXvPO+ZTe1Ob6i1z50sEqmW+A
	Lw5ti7tj7y7L2UsGQLo5Sr3MeBcNgBfJK9kU6aE/UYW0wE8YEHupgCMWt3BY0vGwD47FJ6nbDdA
	fl97ysfIIbeIrEC6uitT4d4zl0ksyq1XzQtX5og61bEd40Ip4yBWM0Id7qvCtB90K0M/cI8/x15
	QjaJnbhJT+z0yMLXwQ==
X-Received: by 2002:a17:903:b84:b0:2d8:d4d2:d136 with SMTP id d9443c01a7336-2d91b244cccmr10797885ad.18.1788083598801;
        Sun, 30 Aug 2026 02:53:18 -0700 (PDT)
Received: from nixos ([2405:201:c40d:9039:89ae:e4dc:6a70:6a05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8750057ffsm18490075ad.67.2026.08.30.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 02:53:18 -0700 (PDT)
From: Ayushman Rout <ayushmanrout27@gmail.com>
To: johannes@sipsolutions.net
Cc: nbd@nbd.name,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f1ba58d6b55abd13239e@syzkaller.appspotmail.com,
	Ayushman Rout <ayushmanrout27@gmail.com>
Subject: [PATCH v2] wifi: mac80211: guard drv_net_setup_tc() against unbound AP_VLAN sdata
Date: Sun, 30 Aug 2026 15:20:28 +0530
Message-ID: <20260830095028.6397-1-ayushmanrout27@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reports a NULL/invalid pointer dereference in
trace_event_raw_event_drv_net_setup_tc(), reached via
ieee80211_netdev_setup_tc() -> drv_net_setup_tc().

drv_net_setup_tc() calls get_bss_sdata(sdata) unconditionally. For an
NL80211_IFTYPE_AP_VLAN interface this does
container_of(sdata->bss, ...), but sdata->bss is only linked
opportunistically at interface-add time when a matching same-address
AP interface exists - it is not enforced, so an AP_VLAN interface can
be fully created and registered with sdata->bss left NULL.
container_of() on NULL yields a small invalid pointer rather than
NULL, which the trace_drv_net_setup_tc tracepoint then dereferences
to read the interface name.

Guard against an unbound AP_VLAN sdata before calling
get_bss_sdata(), matching the WARN_ON_ONCE(!bss) precondition already
used for this same relationship in sta_info.c.

The underlying gap in ieee80211_if_add() - AP_VLAN creation not
requiring a bound bss - is not fixed here; other get_bss_sdata()
callers may share the exposure.

Fixes: 61587f1556fe ("wifi: mac80211: add support for letting drivers register tc offload support")
Reported-by: syzbot+f1ba58d6b55abd13239e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f1ba58d6b55abd13239e
Signed-off-by: Ayushman Rout <ayushmanrout27@gmail.com>
---
v2: drop the check_sdata_in_driver() call from v1 - syzbot ci flagged
    it as reachable via ordinary tc qdisc creation, not a real bug.
    https://ci.syzbot.org/series/db0f7870-cfa6-4a9b-b78b-225ce86c2a89

 net/mac80211/driver-ops.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index f1c0b87fddd5..29743e19a61d 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1702,6 +1702,15 @@ static inline int drv_net_setup_tc(struct ieee80211_local *local,
 
 	might_sleep();
 
+	/*
+	 * AP_VLAN interfaces are only linked to a bss opportunistically at
+	 * creation; an unbound one has sdata->bss == NULL, and
+	 * get_bss_sdata()'s container_of() on that yields a bogus pointer
+	 * rather than NULL, which the tracepoint below then dereferences.
+	 */
+	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN && !sdata->bss)
+		return -EIO;
+
 	sdata = get_bss_sdata(sdata);
 	trace_drv_net_setup_tc(local, sdata, type);
 	if (local->ops->net_setup_tc)
-- 
2.54.0

