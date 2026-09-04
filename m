Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53497408035
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555636; cv=none; b=E7QDWNY//dgCz2NWIug4yYPEUbZfzDWqFKSa68lcX0HdtiDd3DyUUnyfrO/XH8jOO7Ugijhw4vkeoWmKCWZczEy/ShUNQsGf8Op4VKMuDgnCjVT0loNKxcYMDF4jH43klQQAo3gtkv60rSqvp1xmNSmE1TooxCKB2B2De7cRaF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555636; c=relaxed/simple;
	bh=KApseFCDITS/MZv5w62LRujxvx1bGveQCKL4YTEC3BA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D3htPdWnSd0ig5+VQL9yfJVX/50t4wn3dQMqdIQraQUvaenplTDGRqgWFikL77c1o0ekkARcMyrN1/IwIjiSmTvfzLyUbuTmO44BSUJI/FevWbSGGQkOQV5sAHsYtRn5P6SRlKDaI1TdadqJw+mrgfU6OYeumpHQ6cGLyYvl4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpNny2Pi; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpNny2Pi"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b4ae0b3308so1039764e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788555631; x=1789160431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvctqTRoXQqAbiTpeaIWvSug195ZBpWLximGjD0D8bc=;
        b=fpNny2PixshqOhmQnUmEpzo18nr471JI7Jy2QnSq8soXIzzRv2t9xsQOQsP0JSg+8h
         OyvKRjhoVim9/1kNenOndlb19UN+veB0bUrcVFXzRvZJRYLogaUE+3kpoktq2xlO1/bh
         eKIZQYLBF1A+FB+gX0hIx4SeZFmg+oyMHe/piXW0alv240avXKiVzXl9uLFdpgusM5AL
         5YnPLmM7f6UpWjsnLWQ68FnOUx1eViHqJTkF9/CMgjNmOvqlw00U4x5MeJC9/ISlwt5Y
         84Cf80K+IgX/qRvV/RrGpV636VroCwLAguFwTYUzTt7RCx99NFPno359a3Z3B31teDsY
         eJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788555631; x=1789160431;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvctqTRoXQqAbiTpeaIWvSug195ZBpWLximGjD0D8bc=;
        b=PbEIb/yOGygKkA35HLD2TY8rWawlN/uYcDWPckwM3dI9DvDMtzRFrCv3y1BosHATqt
         8UUa66uxFxW3jP/BGYMx/Jofu+ZvPFANim3OlFFPp+m9qlru/i1Sp+iZtVbdqmiLFYD+
         vuD83HN3JidrAgwYTsIFr0Li9ntQ0muEUaE0NI08KrY53mHUKWKklOcPPvfGiYDsb8f6
         JHSo3sHGFYAUCxYlvSCj+9kyStKPVYhuCPV1vGL3M3xgfVJJgfuX+2QZhjbc18aJ7WJH
         SvZRVvYmg9zC1PmMbywLlH0vqR1Fv8+GMfOtZEsB6WEXH2ZOxzrijJWOgQilYw/7jMB9
         5xxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw341voEvxGClNccx6zSS6bd5UTZXqqmsiEH7keueAkMOLqPBIalkiTaSTNap1fTF7zBjkQREkOhjsNLrY=@vger.kernel.org
X-Gm-Message-State: AFuF++mmixaCQ8OlBgQ4NJTK0XZzKYXym6ejJtokU7KoFbFW1qcvIbYu
	/5e7/N/pE5yochEROxOiVigqMaUFzw7FdRbG/2L51OU6F2H1b5fJmNyc
X-Gm-Gg: AYBFou2qeZZpz2TuiIN1ZKOSwZ4DrynpIsmwmj/oYIgtiMHfXr4pLCXXiznchyNVPBb
	L08O6JGjtW+oN5uJRSADD74twK2ZCCBQAQzanPpIKiMqqYxLM6lu9NgkNu1xdLLmyWJZv1WlmK2
	n6eTNO/jVjvMf/p6TJi/4CNfM+l3mG2TJoAleXZ8pHA89pJ+Ni8cBX+pA/UiSgTqumyeLH6JUCq
	0UJwH47VmLLG4PV7wTaBmk1alU9CuQqk+LSVdjV05oTsZqjM0MqLoXT+05FFzKGNwyLP0NZWY9s
	kI1VAOsY0B0JqIFzxe9odv8OuDMnKuPbnIqlMnzTa3M5NULsCioRe8FyDdDuvEDFjOA2sHUOYwo
	f9nfEJoPkthPxvHvminyXCRawHOO4wEbikV6NKma1pxygLhsPokd5XWeTq9v739ctwR8fKhOWom
	0A7E0yagV6GmLXaJIaERNrxXlPfVefXnURAGNUqdK7utuCFyezUmwwfyJRPNogBlKxbaxFISyQt
	0im/HlhGvGZcqvW1e+dOPUcMK9uHQFF4A==
X-Received: by 2002:a05:6512:1285:b0:5b6:4b1:f8bd with SMTP id 2adb3069b0e04-5b616f5b5cbmr1514857e87.30.1788555631023;
        Fri, 04 Sep 2026 14:00:31 -0700 (PDT)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166f6db8sm735384e87.34.2026.09.04.14.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:00:28 -0700 (PDT)
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Janis Edvarts Lacis <janislacis06@gmail.com>
Subject: [PATCH net] net: vlan: fix vlan name truncation
Date: Sat,  5 Sep 2026 00:00:24 +0300
Message-ID: <20260904210024.263220-1-janislacis06@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

register_vlan_device() from net/8021q/vlan.c sets name based on a field
name_type from struct vlan_net. If name_type is VLAN_NAME_TYPE_RAW_PLUS_VID
or VLAN_NAME_TYPE_RAW_PLUS_VID_NO_PAD, register_vlan_device() sets vlan
device's name to the actual net_device's name and adds vid at the end of
this name separated by a dot.

Network interface's name is limited to at most 16 characters, including NUL.
Therefore, if the real_dev->name is long enough, then adding the vid
at the end of this name can lead to the result exceeding 16 bytes which
leads to a truncated name for the vlan device created in register_vlan_device().

This patch fixes the issue by returning -ENAMETOOLONG from
register_vlan_device() if the newly created name does not fit in 16
bytes.

The bug was discovered when compiling with flag W=1, the following warning comes up:
linux/net/8021q/vlan.c: In function ‘vlan_ioctl_handler’:
linux/net/8021q/vlan.c:250:46: error: ‘%i’ directive output may be truncated writing between 1 and 5 bytes into a region of size between 0 and 15 [-Werror=format-truncation=]
  250 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
      |                                              ^~
In function ‘register_vlan_device’,
    inlined from ‘vlan_ioctl_handler’ at linux/net/8021q/vlan.c:588:9:
linux/net/8021q/vlan.c:250:42: note: directive argument in the range [0, 65535]
  250 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
      |                                          ^~~~~~~

Build & run the reproducer:
    gcc poc.c -o poc
    chmod +x poc.sh
    ./poc.sh

======BEGIN poc.sh======
#!/usr/bin/env bash

sudo ip link add vlan1234567890 type dummy
sudo ./poc

# name will not match the expected printed from poc.c on the unpatched
# kernel, there will be no vlan interface at all on the patched one
ip a
======END poc.sh========

======BEGIN poc.c======
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/if.h>
#include <linux/if_vlan.h>
#include <linux/sockios.h>

#define IF_NAME "vlan1234567890"

int main()
{
    struct vlan_ioctl_args args = {
	.cmd = ADD_VLAN_CMD,
	.u.VID = 1234,
    };

    strcpy(args.device1, IF_NAME);

    int fd = socket(AF_INET, SOCK_STREAM, 0);
    if (fd < 0) {
	perror("socket");
	return 1;
    }

    /* fails with -ENAMETOOLONG */
    if (ioctl(fd, SIOCSIFVLAN, &args) < 0) {
	perror("SIOCSIFVLAN");
	close(fd);
	return 1;
    }

    printf("Expected name: %s.%i\n", IF_NAME, args.u.VID);
    close(fd);
    return 0;
}
======END poc.c========

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Janis Edvarts Lacis <janislacis06@gmail.com>
---
 net/8021q/vlan.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/net/8021q/vlan.c b/net/8021q/vlan.c
index 2d2efb877975..b51092d217de 100644
--- a/net/8021q/vlan.c
+++ b/net/8021q/vlan.c
@@ -220,7 +220,7 @@ static int register_vlan_device(struct net_device *real_dev, u16 vlan_id)
 	struct net *net = dev_net(real_dev);
 	struct vlan_net *vn = net_generic(net, vlan_net_id);
 	char name[IFNAMSIZ];
-	int err;
+	int err, len;
 
 	if (vlan_id >= VLAN_VID_MASK)
 		return -ERANGE;
@@ -234,7 +234,9 @@ static int register_vlan_device(struct net_device *real_dev, u16 vlan_id)
 	switch (vn->name_type) {
 	case VLAN_NAME_TYPE_RAW_PLUS_VID:
 		/* name will look like:	 eth1.0005 */
-		snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
+		len = snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
+		if (len >= sizeof(name))
+			err = -ENAMETOOLONG;
 		break;
 	case VLAN_NAME_TYPE_PLUS_VID_NO_PAD:
 		/* Put our vlan.VID in the name.
@@ -246,7 +248,9 @@ static int register_vlan_device(struct net_device *real_dev, u16 vlan_id)
 		/* Put our vlan.VID in the name.
 		 * Name will look like:	 eth0.5
 		 */
-		snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
+		len = snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
+		if (len >= sizeof(name))
+			err = -ENAMETOOLONG;
 		break;
 	case VLAN_NAME_TYPE_PLUS_VID:
 		/* Put our vlan.VID in the name.
@@ -256,6 +260,9 @@ static int register_vlan_device(struct net_device *real_dev, u16 vlan_id)
 		snprintf(name, IFNAMSIZ, "vlan%.4i", vlan_id);
 	}
 
+	if (err)
+		return err;
+
 	new_dev = alloc_netdev(sizeof(struct vlan_dev_priv), name,
 			       NET_NAME_UNKNOWN, vlan_setup);
 
-- 
2.43.0

