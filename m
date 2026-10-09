Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8FF30F7FA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510531; cv=none; b=ONjYw0zfnlIasrMDujOnbkyttklQ4AtBudSUlYWYsOiX8cunTJl8l0oI8J7YzTtFyMMR/NnlV6ezqlRdU5uhSA9PamsS2qwzANojeVnBa02LC/5e7Y1vD/9K604fgbi3wJDk3xZkW2eZ8fKmn7XChPwQnqRTLn0Zg0mFKoZo3Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510531; c=relaxed/simple;
	bh=4zQauuLYgJxsEKUHN3tTR9O77uoUU+rw59u++kdpCYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wzkaowmgk4sF+EMM0HaA3kgA4qgIDrYeKFcPHPnfUUdW9W8pJwdUh7+2t9ht1+Ga+9VwFcvW07T7NuXaAYXCE5te6WC2DNFENaB3fst7TXm6hd40u3QW5l5ffPedb1QEOesMNjlA2pIto1WxIfuh3r8dCYXtzFgn5Uuaruhks3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h00h1Y1p; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h00h1Y1p"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-351767ef18cso2052680eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510529; x=1792115329; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RK4flvPJYAEK9lSesneRcUolXiSZW1erKx163yiShyo=;
        b=h00h1Y1p+NYY99+JyvYJlEPJel2UuhWgsf/NlkhWcJGuY/QjjNsTr2oCBmfGDS8ix7
         ZCM+HH6BnOV8cR6ldjt7MrxxVisDLcVbN0dL0pr2NbhlpHgkrPWvQlnP24NYX2aUMR30
         Nr7LKaYIO+HNd6tqcSozdYcM0pHQX1K2SvsfUYePX5mgy1K0gGW3WMnG/BM2VCYkESrf
         PwroNQVygUAeNIKGoeDEYrXd3m3TLbIYSx5dvoxfvDgjkSe6fj2Xm9sj+C7jARrYOb9y
         vK8zwsms9IFjDUGSu39hPgxbEoHTVr7DJs7oPKNiQShqRRN5nGBT1UW64ovSfaRAf1jV
         JNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510529; x=1792115329;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RK4flvPJYAEK9lSesneRcUolXiSZW1erKx163yiShyo=;
        b=WH4OZXw6loha0ScUDSakI6Tp97Giz7cvP14f1nYTHPeUZfbl9vNRCLArYDcCddLZuV
         E6tRuuhNlFMuOuqOECtVm99P7dpSK0NQJ//C3TwhhRlme7jtUX6YIvrSScMk6UJi8n4K
         IOBIzlP7p/gM3PoD/7BNGNU0OqbQcBCwMVq4xHmJkQXygUoPkOVW190qVJBZQO99Ocez
         wdv/JJF1So+RSArGCLkT3QR4kUCWjl47cNAeBdVBu+Lf7sAHuiDIIVo0ghziB+ZbSKOq
         sm4wAatm6MI5ZurlJtzw8yqP89yM1sLYtpjvFyJpLP4MCn3Ri3vyu3aPOWn9qsGz70NN
         q8xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxraTYIDv+W+dhkNChr6pFCd0f5ubwkiGKeDkoO1JhVEKtiUngnjIAN6nQmUwDex2BA7driTJ6YVZsKtSs=@vger.kernel.org
X-Gm-Message-State: AFuF++mfrVkMA+iDvSbFrXToRr9J7aCdzERKN7Jpx3SnHWHS8CJm/ckK
	SWbIn2Ut1I+xTro+HAXp1V1KUjGA6zWA7knmieVzk4icaistYDRHRCuV
X-Gm-Gg: AYBFou2m92dfiRIrF4GdbFYvV6HHszSiC7rm3O+UasPHxNItiFO3R8UYk+dHf2BBoOV
	w4gNdercXha3qxWw+3cK6vnIrNBsEVGZp5kNBsWscOxnmZFwwhQT16tXZGGkW15LLz7MlLSTyeh
	A8yIO9U6zck6Twy8faLxcRJzmd4dTf1BdcYeLF13CTZ6ouBOst6+RgPmNNN3RWGZX3c9PhGTiwK
	N9zu/PSjcGz9kbrwGbwPA5kwvp7zRgAYWuVtAa+g4ei0L4qcV2Q47oJgsEnO8abAXuwmFCJKRNj
	S0DCuOBKtvFEx0HrcTc2YRjLNTj6KGbPogkqHm1+ml/WPX+MViVccytvnZeAhj92V2Oq1i6O4F3
	tDKrynvobcA3+MD+e+WhvxL7FZzHl4OnyOovowSuDVdMeNk3hgWVjJPTjsJ3JLlkRRjrtsUrn0F
	zOQtJDYvDkVycb1KCOmm483rYGy1GhNpsDFqVyTHU3yjtrCMAQ3TP5FZM75pp2chBAZQ==
X-Received: by 2002:a05:7300:d089:b0:351:55c3:6896 with SMTP id 5a478bee46e88-3537dfd8a93mr802366eec.16.1791510529366;
        Thu, 08 Oct 2026 18:48:49 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1cc25sm2189280eec.8.2026.10.08.18.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:48:49 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 09:48:44 +0800
Subject: [PATCH bpf-next] selftests/bpf: Create the vxlan devices of
 test_tunnel with their MAC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-tunnel-vxlan-mac-v1-1-624dd769c334@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPtHyGoC/x2NQQrCMBAAv1L27EISbFC/Ih6SdqMLcS3ZtARK/
 270OIeZ2UGpMCnchh0Kbaz8kQ72NMD0CvIk5LkzOOO8NeaKSjlV0qoYl4R1FaGMW8tB8B0m9JH
 iJZ29s6OHHlkKJW7/wR1+hlCr8DiOL7I4gKh6AAAA
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Kaixi Fan <fankaixi.li@bytedance.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The vxlan tests of test_tunnel create a tunnel device in the initial
netns with "ip link add", and then give it the MAC address that the
static neighbor entry at the other end points to with "ip link set".

systemd-udevd assigns new devices of the initial netns a MAC address of
its own, following its MACAddressPolicy, when it handles their uevent.
When it gets to that after the test set the address, the replies sent
to the configured MAC are dropped as meant for another host, and the
ping of vxlan_tunnel fails after 10 seconds.

Pass the address to "ip link add". udevd leaves alone the address of a
device that was created with one.

Fixes: 1ee7efd40abf ("selftests/bpf: Move vxlan tunnel testcases to test_progs")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/test_tunnel.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_tunnel.c b/tools/testing/selftests/bpf/prog_tests/test_tunnel.c
index eb93099312720..7b35bf9498056 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_tunnel.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_tunnel.c
@@ -161,9 +161,9 @@ static int add_vxlan_tunnel(void)
 	    IP4_ADDR2_VETH1, MAC_VETH1);
 
 	/* root namespace */
-	SYS(fail, "ip link add dev %s type vxlan external gbp dstport 4789",
-	    VXLAN_TUNL_DEV1);
-	SYS(fail, "ip link set dev %s address %s up", VXLAN_TUNL_DEV1, MAC_TUNL_DEV1);
+	SYS(fail, "ip link add dev %s address %s type vxlan external gbp dstport 4789",
+	    VXLAN_TUNL_DEV1, MAC_TUNL_DEV1);
+	SYS(fail, "ip link set dev %s up", VXLAN_TUNL_DEV1);
 	SYS(fail, "ip addr add dev %s %s/24", VXLAN_TUNL_DEV1, IP4_ADDR_TUNL_DEV1);
 	SYS(fail, "ip neigh add %s lladdr %s dev %s",
 	    IP4_ADDR_TUNL_DEV0, MAC_TUNL_DEV0, VXLAN_TUNL_DEV1);
@@ -198,11 +198,10 @@ static int add_ip6vxlan_tunnel(void)
 	    IP6VXLAN_TUNL_DEV0, MAC_TUNL_DEV0);
 
 	/* root namespace */
-	SYS(fail, "ip link add dev %s type vxlan external dstport 4789",
-	    IP6VXLAN_TUNL_DEV1);
-	SYS(fail, "ip addr add dev %s %s/24", IP6VXLAN_TUNL_DEV1, IP4_ADDR_TUNL_DEV1);
-	SYS(fail, "ip link set dev %s address %s up",
+	SYS(fail, "ip link add dev %s address %s type vxlan external dstport 4789",
 	    IP6VXLAN_TUNL_DEV1, MAC_TUNL_DEV1);
+	SYS(fail, "ip addr add dev %s %s/24", IP6VXLAN_TUNL_DEV1, IP4_ADDR_TUNL_DEV1);
+	SYS(fail, "ip link set dev %s up", IP6VXLAN_TUNL_DEV1);
 
 	return 0;
 fail:

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-tunnel-vxlan-mac-6beb8f462156

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

