Received: from mail-pj2-f34.google.com (mail-pj2-f34.google.com [74.125.227.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E03E5EEB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896720; cv=none; b=es8BWGSNgywUVHq/2dh2zlPav4wvYn7pUKRzh0H5G2v9cklMfyOxGI2WL9UqBN25bdAvGpuFrsqsYHbeCTDwoBrBxa6nlwxlztI7TysvXYKHbcQM+NG/BDW3fDVrIFja5tp6KHQW7YnrHPOcA96et0LiGot0oJ66LS54QW1L940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896720; c=relaxed/simple;
	bh=DFCad/hdE8IpyPcSDWClzGqWb3Q5eeOIEZMZ4lSwfH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O81qUxiS1VZ+DSZOBDnG/NFki01WepeI3ADv7YEaBMBfbKuAYUOS9BaMXDTRH999x8CTmhGHRDfpjsSydUYYEL77YjsjL7lqg00IR3Wo9NNQeNjjBwNdSibwz2ocYyJ/ROGQNh3LQLF3jdruZUj3iOFeJbjbDE+u9DpbElS3lx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=KJ0WEgBC; arc=none smtp.client-ip=74.125.227.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="KJ0WEgBC"
Received: by mail-pj2-f34.google.com with SMTP id d9443c01a7336-2d747eb79f7so14015655ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1789896711; x=1790501511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AC0BwwxocEHWdEgXzu191R0Fu2SszgpaG8S1TYD6ghM=;
        b=KJ0WEgBC7grVskxFMGrsIAnpCAfK43lh//UevXwE2M69FSD77hYrP934ZjNVXW2gEX
         M6DPtn/M9G/g4NobkBMQ5sEmDAS0wV7OTfCaFwCLBmvseOxw+qDw1Y9df1GxWFH7d1R6
         chKnrLkJYY0ICKhXcPtbQLYF22aSnjS2lFzXN9m1Y8okL1V27uf5WEf4msbOqIyPA3rF
         ZCt7upk+lqbhl2D5M6W92pwPaY8pLP3IUr5LM1oxMvgD4kNyWr8ihwoycfDuAMPxbqZj
         kxOVQkugBdLXtoiDj8q73d97s3t1DzhiAZl5UMVCEGcGPhA0b1Hex6N+1TFXxGduM6xE
         eUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896711; x=1790501511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AC0BwwxocEHWdEgXzu191R0Fu2SszgpaG8S1TYD6ghM=;
        b=pr9Pxtk+sY/TlHbQya5v/6YYk8Y36aa+WQMHPWCj9M8Bu6c8X17sJ/WSAQj66A+o1f
         Nh8abvaOZmRv8cwDyUZY2Qpr7VWeNvVfmmOlNtWm6YbD9THGCaLu3W1mnKtcVrUXBb8I
         q7XWKwRh7TAZ7suk6z2p9Lgrtn4DKrySQUaCldIr2Vwjr4s+g8G73pG15yKegWVMFoO6
         j5i0udQhB1tYP9WC4IzKpk6tOXJkbRrsF2Mh2dUIAzSt1bY37CU9VL8c4yZNKEJdvvxT
         Dw+L+a47tt4/mQA5IpOwzcDK+C7BTfonkNi8pOmhOPfkRjTS6RUoM/1jvcvkYq7eR3En
         0frQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgMdxZMeZ7UQAMXYplGB4CS9uvwFtkJ+MyI3Ve6v9X0XF+83VbhPLIQeGsruRogC//uAalOH1BLRGjD0c=@vger.kernel.org
X-Gm-Message-State: AFuF++m6sdNrbOu82tcCktmaxIw1YmUBb3k8VD+yk96/NWB8vlDi5rN1
	d2yUWu/GkR4ELQp2WyVDdfV/jRaNZPVimy1KJ/0JZn934dQiIdmSYeQCbD0T93nhQZAo
X-Gm-Gg: AYBFou0azw7j5xI07Up9myI8kNetDC8GY8FWyBH/Ed42JTyFM10CQr7EKzdSPhzcz+u
	Z4ahLhfKobILEG2926nXl8Ta3BX60QJK9Ry9vO35YBhDwfn1AX0Jm4OJzYes2WmZ4PxCG0LgrLD
	m1u9zC3YyvpD1u1g9lIm70DqtOsQ6wdJkFGK0o1tGjvxl99ui1Fq07mmYLdk1EGAR6E9Kq24s2s
	1Jgm5KA4YDRFfi2UO0KWUR4bzs4F1+oC5x+h//zfieXlAGn0ENRnABp+RXI6JLeiTY3AgAONIbW
	n8bi4G/K9igp+HtRk5CBhUTRtB52nhnlFSlZuRAvCg3w65tIgGmcjLWd3SHrXMReMTVBCfWwdfB
	hMLHY2EkDHUDaXKTJN6W9pLRQDUBVtRLwbF4cHAsvy/qIHYIU6ntGrzlU/0fnzOVGwT55bcOrkb
	lvgKgxWLhM020Np+/m0mf2UsLWc8QeV80UaryjQFSk3BxWk1vgVwOgaBDAwaJtAoJ3ns1CYuGIZ
	0K/DEoBlqYZx3iYIKrnv78snLBWNg==
X-Received: by 2002:a17:902:f705:b0:2dd:c053:82f0 with SMTP id d9443c01a7336-2ddc05383e5mr62215595ad.39.1789896711133;
        Sun, 20 Sep 2026 02:31:51 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17e17e0sm18435235ad.70.2026.09.20.02.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:31:49 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: Simon Horman <horms@verge.net.au>,
	Julian Anastasov <ja@ssi.bg>
Cc: Zihan Xi <zihanx@nebusec.ai>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf v3 2/2] ipvs: reject FTP control ports as data ports
Date: Sun, 20 Sep 2026 09:31:20 +0000
Message-ID: <4f45973a22e67d5ad1c6f2e5455d8b057be60ae6.1789877273.git.zihanx@nebusec.ai>
In-Reply-To: <cover.1789877273.git.zihanx@nebusec.ai>
References: <cover.1789877273.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip_vs_ftp_out() creates a wildcard data connection from the
server-advertised passive port. If that port is one of the configured FTP
control ports, ip_vs_conn_new() binds the FTP helper to the new connection
again. A subsequent wildcard lookup can then extend a controlled-connection
chain.

Reject zero and configured control ports before creating passive
connections. For active mode, reject a zero client port and a data port
derived from a configured control port.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v3:
  - Resend this FTP helper fix with the generic cleanup fix as one nf
    series, as requested by the maintainer.
  - Keep the active-mode guard for configured FTP control ports.
  - v2 Link:
    https://lore.kernel.org/all/cover.1789435989.git.zihanx@nebusec.ai/
changes in v2:
  - Add the active-mode check for a data port derived from a configured
    control port.
  - v1 Link:
    https://lore.kernel.org/all/cover.1789110326.git.zihanx@nebusec.ai/

 net/netfilter/ipvs/ip_vs_ftp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/net/netfilter/ipvs/ip_vs_ftp.c b/net/netfilter/ipvs/ip_vs_ftp.c
index 9e3e005a8263..4822a1a75212 100644
--- a/net/netfilter/ipvs/ip_vs_ftp.c
+++ b/net/netfilter/ipvs/ip_vs_ftp.c
@@ -62,6 +62,17 @@ static unsigned short ports[IP_VS_APP_MAX_PORTS] = {21, 0};
 module_param_array(ports, ushort, &ports_count, 0444);
 MODULE_PARM_DESC(ports, "Ports to monitor for FTP control commands");
 
+static bool is_control_port(u16 port)
+{
+	unsigned int i;
+
+	for (i = 0; i < ports_count; i++) {
+		if (ports[i] == port)
+			return true;
+	}
+	return false;
+}
+
 
 static char *ip_vs_ftp_data_ptr(struct sk_buff *skb, struct ip_vs_iphdr *ipvsh)
 {
@@ -319,6 +330,10 @@ static int ip_vs_ftp_out(struct ip_vs_app *app, struct ip_vs_conn *cp,
 		return 1;
 	}
 
+	/* Do not redirect data to control ports */
+	if (!port || is_control_port(ntohs(port)))
+		return 0;
+
 	/* Now update or create a connection entry for it */
 	{
 		struct ip_vs_conn_param p;
@@ -529,6 +544,9 @@ static int ip_vs_ftp_in(struct ip_vs_app *app, struct ip_vs_conn *cp,
 		return 1;
 	}
 
+	if (!port || is_control_port(ntohs(cp->vport) - 1))
+		return 0;
+
 	/* Passive mode off */
 	cp->app_data = (void *) IP_VS_FTP_ACTIVE;
 
-- 
2.43.0

