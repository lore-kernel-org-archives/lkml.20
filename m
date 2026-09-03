Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E04A4EBAF0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452797; cv=none; b=M810q9bMvpgsxYxtrhKBsRATmrtXBsZ/1BoHJCFPiOPz0Gs4GZjoeiYk2xo1D2BCwyDq44nMuQ0KnlZQwVHnC2UIeTz0SgSj9M+2EicMyIGzhomD/VvH6HS1HvLJjnYw9M4N2EaDWyNcSkTcXAVx2IaUxfMMi0tq3QP7ZX/oZ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452797; c=relaxed/simple;
	bh=hg1/sQWRNTRJvXeK4q+etAM+USnHnJ7uuI3nEx7M6Uk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U3syiFLwsrIZTU4MdCn9bsxVgP+0f8pfd9GZ4JP9BPdepeZuoxeMyyryjz6PeMXJlzGzJpokmPtbM/NYK6qiZYyMWuJQPlzL1Hi/hen4pObNuOw1v8tG/0NsCT3qGL7s7KvD4Q64sIUW+N7NjrN+zMl4/xTbATeTXgypDuI33hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+LUSiJ/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+LUSiJ/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499b10c86edso40625e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788452794; x=1789057594; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qd5up/noPQGnqsemncaHSEHS7t/sLmdH6IitgfrFpdA=;
        b=r+LUSiJ/w3lIy7jHhH/lr7Cn1cGtEvjmAV5dp6+lm7z3GlMNa10/LcZXMgB6MmFBUJ
         Tntlg1D0DxNnETWnlPzLdnK+GJycGUK/vEQR3w3LwwHNUTCRPMJh1cBt+nx/004VDzJM
         Tary9HGStvUmcxmcMgCxd1K3K6RA/Z9JUH0fE6Jkle6+o/RqkjDi6Uth4cI/FXK3jbPk
         DLLVwoQNAdyN9NNvSSKzleI28Qe83PEtKTLQ+A+MZh7/UOFLZJWo6Kpe4QSaneWWPVqy
         kgGnaGGlzeemtKfEY1vtkTgMSHxaRNzcfza14mDSXCI+LM348psTMKy8Hdi4FLaeLJLJ
         gPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452794; x=1789057594;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qd5up/noPQGnqsemncaHSEHS7t/sLmdH6IitgfrFpdA=;
        b=hW/JOFtPj33R2N0vIEi6QdQrOi67tju7Ni85a4+QAjafb8PWkIQn7bXVeI3WuDFO2t
         i88uo/uL8UCY2CetSBinl0RWZueis+qJtvekrhBzSG0WYiBCIIgxJoQx0FkehZ9ZUmLw
         DeZnkIcd3EdenCfzEQzCLI8D3X98T32kRBuN0G89gyJypp2d1AvHAnU317M4g6kwQe3H
         G5LgkFHz7QjFyOotMVumCyQKnzr0SSrGNz5Tp8bD5hyUoCOiLor7Kvf7jnSJOSObMoXB
         WtLH7O7C6A6skbQhww+lvMU9/l0LpnlDlwIDLegsdpT3vhj1WV6/K6IvL5zWBsYhVOxN
         WRtg==
X-Forwarded-Encrypted: i=1; AKwUvBw9gvWtVqXqrgeF7tYofvjUuYhUmMBF3r1ncI4WhIB4t5AFR5Ku1dgJKLfPOsZA1laOsM/zBL5n2RfBid8=@vger.kernel.org
X-Gm-Message-State: AFuF++kUSRK5PHogcaEsFhvaHsJB2egrOFXm50Y+uoz480aAUia4a+0G
	Z8BjHLwvNcjQzB445H57C3TCk0CdToZV29TngJJcJ5H9+eRsXoHO+aM5
X-Gm-Gg: AYBFou3wRbOAELFOK3IDBXIKd6OXL65xs2wQDox9To/f44SeWkHCICE5WlMMMU9e9T6
	nvHjeKvPTlblgl7TQVdsUvt+42ly1OjTa5OFye/i4psHF8ggpCyH1K1Yz558HE1qgSsotQfslE/
	BeRjd+m8hYamo/09IYNfLVljHvhUss7+u22Y+nmZUNRRFKuCWGcf40UGm9LJXL2PBxt/PpZS7TT
	2BU3YFHs+4M412XOu99bbBr811d7/uIvI05l4we7Vw5b7KMEwK4eR175BGd8LAGRSUehQwEMe3p
	eH7iEthxA6mUBfOsCSU1oSnVG/ZDe+ha1TfQRnZPHMz6yVVbA7ODo5Gs+Pvr8VKemQx+lICaMme
	wKw3wnwx8U/26M2F+MAXP4JodU6tydq/vdFVaLFVnkoypuYHtud+NVVYidmtVW63EGrWoa9BFF/
	Kcl2AQvIfSze5I5AlmxqwSdz0nE9//qiuUEIvm1sJ/hVpGJB0yAH1MTL8Z
X-Received: by 2002:a05:600c:530c:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49ce58369f4mr112994515e9.1.1788452793719;
        Thu, 03 Sep 2026 09:26:33 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::6:124b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce592b019sm5052925e9.2.2026.09.03.09.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:26:32 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Subject: [PATCH net-next v4 0/7] netconsole: validate a target's IP address
 configuration
Date: Thu, 03 Sep 2026 17:25:59 +0100
Message-Id: <20260903-netcons_ipv6-v4-0-bdd183c844d3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13OSw6DIBQF0K00jEvDxyfSUffRNA0iKk39RCyxM
 e69SCfq8IV77mVGzgzWOHQ9zWgw3jrbteFIzieka9VWBtsi3IgRlhLBCW7NqLvWPW3vUwwpFAA
 lgGASBdIPprRTrLujkAzpaUSP/4v75C+jx7VtzdbWjd3wjcueRhFHMgL7EU8xwVQQxSGXrFD0V
 jXKvi+6a2K1ZxtMDz/0LGBeJKWWmVCSlEfMtzg5YB5wromkYDItYIeXZfkB/VdEez4BAAA=
X-Change-ID: 20260730-netcons_ipv6-565d55f55729
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

This series adds two validations to the target configuration when the
user tries to enable it: first whether remote_ip was set, and second
whether local_ip and remote_ip address families match. Refuse to enable
the target if any of those validations fail.

These validations are already done for the target passed on the
command-line, so this aligns dynamic targets with the command-line
behavior.

The first two patches replace the per-target 'ipv6' flag with a
per-address 'family' field, which makes it easier to detect these error
conditions. Patches 3 and 4 implement the actual validations.

Patches 5-7 are follow-ups from previous reviews: move inet_addr from
netpoll.h into netconsole.c, show an unset address as an empty string
rather than "0.0.0.0", document local_ip auto-selection.

Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
Changes in v4:
- No changes, just reposting post merge window close.
- Link to v3: https://patch.msgid.link/20260814-netcons_ipv6-v3-0-bc0915e8c75f@gmail.com

Changes in v3:
- Document local_ip auto-selection
- Link to v2: https://patch.msgid.link/20260810-netcons_ipv6-v2-0-3d4fc987a90f@gmail.com

Changes in v2:
- Show empty string in configfs for an unset IP address
- Moved inet_addr definition from netpoll.h to netconsole.c
- Moved address checks out of rtnl_lock()
- Link to v1: https://patch.msgid.link/20260805-netcons_ipv6-v1-0-170a35b92da1@gmail.com

To: Breno Leitao <leitao@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Gustavo Luiz Duarte (7):
      netconsole: add an address family to struct inet_addr
      netconsole: use the address family instead of the ipv6 flag
      netconsole: reject enabling a target with no remote IP address
      netconsole: reject a target mixing IPv4 and IPv6 addresses
      netconsole: show empty string for an unset IP address
      netconsole: move struct inet_addr into netconsole.c
      docs: netconsole: document local_ip auto-selection

 Documentation/networking/netconsole.rst |   5 ++
 drivers/net/netconsole.c                | 132 ++++++++++++++++----------------
 include/linux/netpoll.h                 |   5 --
 3 files changed, 70 insertions(+), 72 deletions(-)
---
base-commit: 7042c8c193e5d634198b7c766bb3a01c8e3ee0e2
change-id: 20260730-netcons_ipv6-565d55f55729

Best regards,
--  
Gustavo Luiz Duarte <gustavold@gmail.com>

