Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900921;
	b=fVnVjJpIykS5L/h/vfKJLn/iFQGPGjLa+p71fXdiAUpqxyCY2K2Sb68kuEs12KSG+MOL
	 1pEpBPqFibY7FuPPmAE4tehbTUtmvy4lwZkUbYAiMHPlYbgJHc69IZrAOomdAL+ntsnZN
	 nNIQ/EgxMhZjEH9VPcWO/UgieE1NR1+OBWwQ739dq+ElQR7ZnceUrPPnuWW/+F0UUv6hY
	 Sj60vMveM1pK8dUpdB1eE8uiBjDAA7olqSWsrCLYzZVtdjK5xBSQ0jRVNSeXIaNtn+M16
	 CbygU+I2fQGMV1Ge/bcu1pcPySMtGWXZyx8+DWIb7lJOFk7JdsLPu7M66Bw7SA7o2Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900921;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=;
	b=SpE09ISqskofMxErsRzmjALTRmNkXKTb/L6IToJFhBPjUY53CUBkiXZkDA/ePMhQ5RFI
	 RIAmQOnJdXBlZGcQX3i8QefZrh2h/khrJrwnvl19NVkQt1QVuMQeaby0DCymWb+UJ0kBS
	 N4RWQgSs1/ify9aVWZc1hEMMCh8TRMVk24KweRXVn2q408Jh7/DX8tu9pCT0QTuUZ6gkT
	 FrYHqEV0LXwKCTb6qo7LZ2+GKCjtfO/V+tLWghCul8mk/2W1zjH6mJBoIs/flKNnB60Y8
	 GtzvL2dqllYvstJaKbMxGo8486IDgQetfNdrjuK3gyxe+zvi+ou0g32XLmoWWvqhKyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=f6PxyHgi;
	arc=none smtp.remote-ip=66.163.184.199
Received: from sonic301-30.consmr.mail.ne1.yahoo.com (sonic301-30.consmr.mail.ne1.yahoo.com [66.163.184.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17BC606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17BC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=f6PxyHgi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794900919; bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=f6PxyHgitAetnayCzFrJV6/+fKS36AOzv5dzYwq0IpjtaM86oqC1wiNi6oDoBH2cb9br0ulDhKBWmIm7Zzxw7Aa6Xj17ismsHpBaI+UrB/kH0PJ2VaD45ypqdskZT8P02dXOj/Url1sBLqg8L2Co+92EBLTjr8J0xdc0k4jVUcK6zx8kRbFJmV94xPZqqzqiPI2TpGGaPN0gFzqtxMxYl7KUdWD8cZNb23dQu3Te5T+1VLPPiG+OESqWib5HVtGbvADbDIdxnTLudNvG/UNBTQfOzuoC5Q5ApDSijG/T4nhERWH7haDTOA3Xcq6c4AI4DHrrewQVCmQo7roM/EuKsw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794900919; bh=LjSoFT+0OqWBZMFaulMLFOIbhFKn+vHG0DeM+7v8n6d=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=pb1UwmsTKJBPQFY/MibODWe8Whnd7QI3I8+a6W0QR1/wfCT57ZC6OItjEOyNYxszthzosyjghhKmzvHqQosrXxojQW0RuqViiMbWORAWeIO5O5X5zHTa/uSe03RcpHxLD8t4o0aey6H3ia6jxpkRwrQ6iymPvJGwa7YVeXBUgsq41+8KMrLHqck0weMbjBREeIVd9w/I4MqVe607uQQzngUbnHxZ7UbxYWpQqYwgMFh4S2i0b4RzjzMCQEtQRE8czxSScNIS+1tNgdPYzFPniLORij4Dm4VNW0a1bXY+e2AGT9x0+KytVBsh0CWdrVEGOeb1XZgb6bu58I9duUJt+g==
X-YMail-OSG: _i0qCWcVM1mSiAkxyltz5KdbVFmeFR7BmV9nySilrEDZEwW8FHFaNMANblvMluy
 ZosxJDLcd9MJPPmHv70e6ARMoS8UazlzaDAQBs0cvcKYE49VsUCT256TpwVWWBSl1ivnJ3k47RMm
 Z_0gGQegtLXYVT5rG7tEAQifshi7RpZhiVn2S.gyEzk17GWZoa14DIyC_jDWO2PNOsqloQZULt5_
 EzDj00h_jy1oDK5F9BsENh65aNpEKoS8J2znZ65LWRN_ME5NoYItl3.tid4eksAJG.U6vhCSGblt
 rt4HnW7l14.YUVwPsWEOT.GVS3.P6o_c_NBBClA9FksxdtvEnXN8eb1lUDwgwSRPO16H0zUoYYei
 Zv03IiUD8rj.8M6dmPccI0bBCx7Kp.ZwxIqgoDaqWjSr_cY1WViu_m6XEbbIKm2kC56tw5UZSOGK
 2qAoMG3LgqxvEAOYUONvwhW6BMeI80hORwnJCPuCjL_BjvtujxDktHWfMX00F3GCXhXOlUO4Zd8b
 JhfBuBB9g32nJo9MKY.H1vtxpecWM2nYuGQItvgroVxdY_yzf3F6hofEwDVfAo6BcO7_5qM4NrCe
 KBZQXxFcdkV0k1h.TNZhK4uEElwzDP4JOd.dHZKbTRalZSoEUbOnKMAU2Zz2N1vyDr8n.udXI4QS
 30EDb1njCfwZOxjJRn_UbcmsBjdrJl6zaobRJrenffh1Yl9MhbCamp9gxlsBLVh_LCt9pgx2Vl6l
 nT56ZKC_vEU6RWhJYOAnLokUd2bdMdpJd3hI8djXoJWkw.iDyNjyJInmvIYglUztKxw.Kqa27_uP
 wjQiuQVJTGSGMhxyHr2t83IHPJi3bg_Ie5aSbiBOoFDKOlufk4.asDBIzMP2_MaCHEvDtTrsFmcf
 SWWPNLaqDOnw18QEiQ81VJOcnA5J5t2mE6xzuvXNLLZ7knSrNYnStFaRkpZmhOPAdPqS7WJZDoxg
 Kp6BZ2pq1vMHsmqXsoaYpiM1Pqu3WZEWUYRPBcAe.jfD_IQYmJ5kN.0Ebk3UYZQHt93P95oXrvNd
 3shUx8bWR68hmiamA4l7_y2Mq6wFr.qEQYey3WRQBDv44jjoqY.gM7pQJOpNhANE_.eD7mZCuMUj
 QAiAs4lTl7zhGiUQMimry1ObQy00zju2EXy3gx21n_9vtqYZmHLChN0WPX8iyo4GEu_rTBd0Tzn9
 Hp2bahVG5hC4jr25zgha984H9zIHBseScqf055pobH2IriMGh_6Cs5mRi4gpmKQFqri3k_QEdANY
 glctithDcKJTQPHqHM7UAATvHoGM9C__RwMgJKUGJi62F68Jab7wyJzN1a.GIKsSq01k7aRKgvJm
 eZ9rjn_V8aRoRnyipII4uw585bP1jOGzFReH.FWBsc05ZAwRgvWskEE0HbtRP1QhTzBYGM48yFBu
 tyrgmQw339EJXomAGjCFogZdneb_e9xhjOqSdBqtC2YwPsLTJSke3BVmf7pJd4vkUmQM20_c1d6j
 .BCyETAXirR_ik3mr8qoi.XMIZGBB5K6_Iulmuom_ZclsHc_8b60tyv1mjstoAfWsp7Lza8sQpc_
 5eird9kJu2ZoqoT31m6k3iuLK5yfxym.kTxNoY9ETYH72AXRcKEqeQXsWNLNUinuydsWIja5HuXk
 SafOQ7CgTnxEM_PXd5XrGNl88UWMja9bZY8udyOn46OC_Lrr0wKfDFdYxvZt2FQceky.RELw4MTu
 m8FdC9cgxw.ZuQ8hjsPMqsxvDDjQY7.gxKeKzZA4SRQnZJq0NsAg45ftxkzIlR1Ar4uRZO_R0HO2
 0GgaPNS.O_PZNzvkOF.OlB5mtzJYQWxedpH3_9daevDxY7ZHFZMFGDFjr7IJ_cayTDxIYuGCdl58
 tybSFMXzcYGMdyGMvIUgtGHxl4aia5m6Bf4hChbaKUlQRxPbFPQXwDmf07d1hiOFdVmeVVOEcxBe
 2D9Ms7WV3ODY9pKkzfOmamP.an1nF6yJycT7C6fsDNnbASuC2c7HsjdqiGg0dC.h74A.23dVgMWX
 k4GdUEIW5ya.OcGNBaKdB1TP_GvqkJiel.a8AeAMEa7MyqPELncxnLufysiY79KSDpwS9fegjOTe
 .S68gtgy.u4ddOkzcKuMVhNDrlk4cZIhnJ5ZMlQWmQkk8GuUpvat.cFttNM0fBmVYej2vBDcFcWx
 2bIuH.VUXFgoAV_tBcNF6yAPbVZPQt64JhsBeU0ThrXc5h2vMxRA1xfSjssddzp45W548oa3qNRc
 5MUwYI4NuJXVsFvyiDAVxly4yNgOILuBSVvjHY5CMs4xxhky_hHdnoWqNR0RrHPeY8UVxtZZuAtN
 rmxAZulQNjU4-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 2dcbd164-1bbb-4ba1-a369-91de50c29f04
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 07:35:19 +0000
Received: by hermes--production-ir2-5dd9bf4598-fvbwk (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 698cc75b3cd1614853c67365388ff6a3;
          Tue, 17 Nov 2026 07:35:16 +0000 (UTC)
Message-ID: <f1479dea-8248-4bb3-9981-a84886f76dc9@yahoo.com>
Date: Tue, 17 Nov 2026 08:35:15 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v11 01/13] dt-bindings: net: dsa: realtek: add
 RTL8367S-VB
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com>
Content-Language: pl
In-Reply-To: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27017 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

The RTL8367S-VB (chip ID 0x6642) is supported by the rtl8365mb driver
with the changes that follow in this series. It is identified by its
chip ID register, so it does not need a compatible string of its own.
List it under realtek,rtl8365mb.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/realtek.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/realtek.yaml b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
index 473facd..ca775f6 100644
--- a/Documentation/devicetree/bindings/net/dsa/realtek.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
@@ -43,7 +43,7 @@ properties:
       realtek,rtl8365mb:
         Use with models RTL8363NB, RTL8363NB-VB, RTL8363SC, RTL8363SC-VB,
         RTL8364NB, RTL8364NB-VB, RTL8365MB, RTL8366SC, RTL8367RB-VB, RTL8367S,
-        RTL8367SB, RTL8370MB, RTL8310SR
+        RTL8367S-VB, RTL8367SB, RTL8370MB, RTL8310SR
       realtek,rtl8366rb:
         Use with models RTL8366RB, RTL8366S
 
-- 
2.53.0

