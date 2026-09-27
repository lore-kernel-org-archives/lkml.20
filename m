Received: from mail-pj2-f20.google.com (mail-pj2-f20.google.com [74.125.227.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461F24DCF6
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468692; cv=none; b=FI8/+XLvyR7aSEnNYHyUXMtUhiZwv5H+OaCqaahVK77dMXkSCne2z8HL+bmwz3nWlSvZVfvuOuCWD4L6atNlhmgbuL0dYSTj5iXaQZqvPyom7WMvfvAn2MXvZn5DhyxH+3r7vm3Jf8MsL8O7ESkcfHV3RiNti/XgkY8fuJCc6EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468692; c=relaxed/simple;
	bh=J8Mf3HYZaTmZYQFkYELALEytTws8uvz/goY09yFk2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h24015njcGoSay66lbPYT6/U1OHYQBaJpn0IP9lCQgi2O+mQa8PNktboVe2eQCLFwLK83PF4BaqE+pgrPIptThqsehXciRsiJq+34K3cLqKXN8+RSl6sb9QXIYpQnYZJEjaO1P5oxojTAp1mUaDFyam48iEJc8RLfInsEkA37uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFdf/JV7; arc=none smtp.client-ip=74.125.227.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFdf/JV7"
Received: by mail-pj2-f20.google.com with SMTP id d9443c01a7336-2d747ed9866so13975815ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468689; x=1791073489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=CFdf/JV7+jF+CBKIz7FEXWGpUX9VGYxIbzZ/OlilwhqDFv9pF6RMhlq1h8k9NRk4XG
         TRPrKKSN3JVKFma9E5pSpvwXD1WwMgcE31oFjMStyH3YK/+nUn11GM60ty7VH/IJV3y3
         6SsTN4ppBhkCVzOxS8EY1qH4KoYb7OTpIq50WYtHRF4bWu6lPE81hLCkRoGTpOi09PFC
         Mvq7g+Ph0qGlqTjfLdUTgdKGmAtvAToNffpVsTKPNh7xU/4dxpoNsUTeJ+Wimc0ZvIrX
         iclIQFQ8FjgWn8NKoDCJn3y+q1LKZOAgVbSx5hbdmKcceQp/t5XA0SmxfxirIa/63oIq
         KWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468689; x=1791073489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=TfNfywIWlYI//QmV5sP8oXHzKrSoZYvExvTmsEsTzJ/3zZnJC/z1aljvfXhowCjcXi
         mjfj+q0Fheme8GUe5uutyHH0TrloW5uz4eEhVC7h/13lxMAkS3/9n9vrnId5kgeVIgzy
         QQnyzH1Zv9MFGzSwj5bNoR/R3lYdpE6qyTWHHOYyTCvHeoPem0iF3G+o807+JozxveMf
         xeZIomd1cES0mztWDc4KcvZhD/MiVfT9jnz+0EBYncVClX2Xb6uGhi5kJ0qZh19rsnOe
         qWZi5Of85oqNNVFhIqlCZx+2Zp0IAFL9a1rgjib9j03oU0kkCTaOefStzrYrHhw5uIO9
         odlg==
X-Forwarded-Encrypted: i=1; AKwUvBx/u8f8XGdOyb1/eUU7GIKI+UJZLVVc7J1rHO40OMl22lRvfCMELpn7P9Fgnzsay18R+DR8/twnZtIuSA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDeBqhNTHg8oCXpCVq3TbnwiC/bX0SnMMaJcQ4W2TexQyw59UK
	1BDOPZjtXuJDEYJ/tJnsm9gRKKKQgKKa/5s63ZTOBMfUfzjDS8vDJp/z
X-Gm-Gg: AYBFou2s9YbY7IB0BcpqYZa8sAwYtGbjnSwzAyLT2hi4zuCiYJOA9SIyuzz8Eo4+FKL
	eZ68csKwTcRZj2gtx/7hDewvJN/DiBzP7p2vfEmdzETrlyyVVXT52d7i5uCNJCe8yXLGatyaYi9
	1Cg760/8k/WmSPZJjFE/0ObnT9QzkvEfzx3mdhifSJSybQPN83t6j6K1wyRm2/sh+zm1yEXWc1Z
	eiE0/X06c155P5swGep/TvxTSqKRsMoVabi0QYS6+KpwOvlpSDLYha+sUGVBOAUV/+5Cdi9J2+E
	x1svZkd0L5gqN0SndvqHiF0gsgNuT738waMpliQkqBda0MfdJD9IRrDEK4ZmOXxnJ/a0CaOWktz
	k0WX/IGQ5Y+iD6iKvwLMhB/hLC5qGUPg8P9/KKexQ+DRLq4741vYPUgZbDWmnz/ACZR6YzwNqwU
	hEAoDcDK3lQ6HP3yXuVq7IHLtZE3SgNOKlOKwbBEdOhh3d5JA8eG06jhVp3UtfhKvrhj1UyljKH
	fnxyd5Mnv0foEn0Der78l0Lq6XKlmrvPIjNBlu0Yh7n1AHNOIhRq0VXcPv5
X-Received: by 2002:a17:90b:2645:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3a098e05151mr8205483a91.48.1790468689284;
        Sat, 26 Sep 2026 17:24:49 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:78b6:7bf6:b1de:12ef])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c680sm2698224a12.16.2026.09.26.17.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:24:48 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v8 1/5] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Sun, 27 Sep 2026 09:24:23 +0900
Message-ID: <20260927002427.4519-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927002427.4519-1-sigefriedhyy@gmail.com>
References: <20260927002427.4519-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
declares its target-netnsid as s32, but rt-addr.yaml has it as binary.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c..17ead2203451 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -119,7 +119,7 @@ attribute-sets:
         type: u32
       -
         name: target-netnsid
-        type: binary
+        type: s32
       -
         name: proto
         type: u8
-- 
2.43.0

