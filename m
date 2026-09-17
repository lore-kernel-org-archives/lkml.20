Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99628347FCD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614195; cv=none; b=BZWabQkSlfAn4PlzewbX2TUrTwvqBx5994x9VLiy2OH2C1FuklncIdPrB9ACPmPr6VD/zea22F8/kW1uhbEWOhJCwgOHP//W3uOi3ef1PH+zphJf/I8EgZ9rbji4cKWUlcLIpSx5p+ly/e720dUAi0ffSfeeZI6IQLJ6BM/xSQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614195; c=relaxed/simple;
	bh=ZAnMJFfRyn/L7UjKQ6wtOpZX1ERwvLKzcxMf+sbJyxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+SKahGNB3l98zSoIbc0V23hT3RxEWTeM6WP0PAm1mFsWbPGgukFqfcg12teDP6uiFCPEgd9dtclgUhMtQ2+VHpbgLnF8K2X5h/DIRWVKx/yRjyAmnkFmXpEtjceBB9UhvV7t2gXelWKJxA73SbZZpQcQUVSNIVj1uWdt9IxGzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=ko2XybKf; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="ko2XybKf"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334ddcso3248825ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1789614190; x=1790218990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEiJ73gdk+1H2UniqJzXdx9Ojg0hZPLKGrnSs4IPJHI=;
        b=ko2XybKf+ORIdYCZGisQEx+vJ90W4rwUFC+yt/UmDoIucUX3CJlNfEx/m0E5hYYiiF
         vE3yYs7g03ua78cYT/714tTFpd+T00ig3wnoE6+NSYH70jYFyeqF4rkzXytzfYUkJo8X
         /fG5dy0XxE4zFdIRt8GglWF89aeWyPpK14Q3aK/W3Veco3WmWhwDMNUeTWp+6QMiAcTS
         641xbiHUYWoe5ffuGxAMXfFsrRfR9G0qgGvuQGLLcfAjVSVy5lolL8J5Sp7nz/TXNseI
         FjlOW51EO+2GWMPwo0rKZm/mMldNTQC8TaZ77cPHBtGFvzAgu9NpMuaTsvD9nDj0S5/P
         LmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614190; x=1790218990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEiJ73gdk+1H2UniqJzXdx9Ojg0hZPLKGrnSs4IPJHI=;
        b=0gRxsoBGFIRDQG+z3sxCTYCgyArsCG9NKHAgCv0ndnl6LL/F460gXLiT0oHspCH/EV
         rMUw2YTvBwp9IS97Y60SWkUyMA4DLLxzFlN5yLnf+cOYco8Nr2VkVYiIS68EsbewfKZI
         CBolSzxY1CWzqkb/cEidymtumlDGQbMiDFyGuNmEepy/XREcnFw8E7QVYY3QSsl9foiI
         ki503ZNtDvJhKIyryfi3VD37NsGTkpRoud4mge9YM54Bexv1e99dbsd7SAXnzyPWXvBA
         lGgR69DMLL39XvGJuQYqhFYKkPAOqeJ66IdNAlIMWQeX0xKzTuhoh2ypk7LXJOxfFMZh
         v8uw==
X-Forwarded-Encrypted: i=1; AKwUvBw4ThErEEjHY1HZLvzxIZhm7IMTPDrzHH80YzB6ULhKFiVcWqq61syxgW3V/iYdN1WvtlGc7gcc/OHVIlk=@vger.kernel.org
X-Gm-Message-State: AFuF++mjgBLEj/jyDMmOW8LnnwhYJdIgbr84JsGKErH3ijaOVy8J8vdN
	nCVXW1LUMOqT3/ac4FzAC2AkA929Mjgk/jptcIGPsKSwY5rywLsrQLW7QrNLDHWCUZhy
X-Gm-Gg: AYBFou329f64PjHIxMDWtfkFX10zlneAoRbObQKJE+/v6N7Fb5y8VALDv/kxckRzkil
	OEwT+c5OdHRbT417uUjf7MokksyR7EtZqhBWE24SBupRE/ZQSbAmJNMIa4TLmPUi+7oDWyjeg/m
	wzyA1a72/Ce8KchdrkURjJCHyPSS5ItcX8SODcUX/CRW2f9ghlOm/nCTMv01raCse+NxXrjFdTn
	rkL/0GibtAzlpWDH7at52wflmBBIRVCt4O+6J41DbiQF0JVtLNooaZVejRsKeauXGC5lFmMoqEk
	Y2dbbtT2tZWxsrl9Lf9hpMZYXjJNZy7kCtAWN37rUjSd1izQ4sm5xtb+GzmORQbAfUdx2egluq0
	wYqMDmbqT9NfFOGdNjEW34aly3t0fA2NLgnxJd4gZ9yV++AWdvr0FrawBqCxYelEgx8lippM3+I
	eS2GeSPfRwBd0riJi9/5fI3HpTKUbjBkyUNlUcBjgZLWQqTh6hopiv+D/LLXKRmwzy4Qq8o6CbN
	TcIdQhStGLrdWGRfuxO/uzdo0/XJlilpdyD/Z5S
X-Received: by 2002:a17:902:ebc3:b0:2d7:107c:917b with SMTP id d9443c01a7336-2dd8ccaa304mr114450195ad.0.1789614190034;
        Wed, 16 Sep 2026 20:03:10 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f1b862sm19167845ad.71.2026.09.16.20.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:03:09 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: Simon Horman <horms@verge.net.au>
Cc: Julian Anastasov <ja@ssi.bg>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>
Subject: [PATCH net v2 2/2] ipvs: reject FTP control ports as data ports
Date: Thu, 17 Sep 2026 03:02:52 +0000
Message-ID: <20260917030301.5502-2-zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789435989.git.zihanx@nebusec.ai>
References: <cover.1789435989.git.zihanx@nebusec.ai>
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
changes in v2:
  - Reject the data port derived from a configured control port in
    ip_vs_ftp_in() to cover the active-mode bypass.
  - v1 Link:
    https://lore.kernel.org/all/cover.1789110326.git.zihanx@nebusec.ai/

 net/netfilter/ipvs/ip_vs_ftp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/net/netfilter/ipvs/ip_vs_ftp.c b/net/netfilter/ipvs/ip_vs_ftp.c
index 9e3e005a82635..4822a1a75212d 100644
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

