Received: from sonic305-22.consmr.mail.ne1.yahoo.com (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D585118D62A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113134; cv=none; b=AMPOvEPlJZ6XbkUJi8bkGwVtec0LON/zPqmIXsv2qkTX5j72OJ2lcChCPRcXS0PK0UlNBotyy9/k5GoNU0fzANMpTMhtMyimOxsYT4/iBwnkK2cHNqtYo8ikOnKfTenU21fAPtRqeUmUAuvYpk/4yhrR5NvY6X3jqYhlyIG2RCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113134; c=relaxed/simple;
	bh=DZpciyiHrnfZi/U6tegj4iEP8brHE8DE89jDeeiGZ9w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=dlI3r+CCIQwqL4eTMOnM0qLCX6UW38C7L4UizLWIgGnKgc1wsHnvozm6qFNY8KvbpJVo8aqKojCH44p6r5KxNVQKIApc9W78HRUt7A3ICTekJUpZkYTA0hUmMqkjwnCXzHYdyxttvvUbkfCLfk6MXbk1apz6xWcqTYQSaLBa/LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=FNvkqChA; arc=none smtp.client-ip=66.163.185.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="FNvkqChA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792113131; bh=gsRorfpiRWfdlb5OcQgolk/n/Hz6due+H0Gle/vIg0g=; h=Date:Subject:From:To:References:In-Reply-To:From:Subject:Reply-To; b=FNvkqChAemmLDrgsx20kQxZ+ssdDnp2TArId3XCTVggsYkrjev79M5AAb7TCbBg1XkWqMbm4kwavnafyuF/JgmAoDsG+972U5PfBLJ/s3BRydGxUo52f0gCv+4m8vS/c3KgfQAsHKdQ7H4OLoX0kTrTPxqDOGVHjptZjDveFH/IRX9E2p1mpCIvkyv/8bq1Q8rFLKobwCDzdNXmWQoE+HlN70kUjHW3QnKv7s4GZ7nIfMWllEiuM6W827m2gs9e70Rfzy22a2Fk/WNKxwz7ulvHsielKaiYM+w23R2VcIYADkz5uJPvVPL7cJRZ5KiosESftUAqKDwYIj/c2ikQV3A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792113131; bh=vcjEdeXFwW4l/4DqZskS8DdwzWkJd167Ccre1cdoWKU=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=Q0hAYnyqp4nz7HuljxP+HB+5HowJFH/sw6iCycE0rx2X5F7dczgldLEw7gHYxzAJCswN9H+vzKtT4Go42nXhEnTQSEJ8nZSnAdOTENpi1iYDBN1XqyNlYIK9IQUUn9GCpRQy8z9ADdZ4KUZdGowQjL0fG00ykWgdUg6cd6LpRwnKcDLOxpbO/FyRSth9t2fw5wrsUrvaiemqDaPPm9E1JHBkMUnB6W1WTSTLB6RD31S2lYkKvW0G6pgKtkeZTA/CQfsnDxQMmAMp4lLVRhfhjIV30aCEnkaugt6Vt3NyCT7BuCE486szSYICfOVnRJ2t5iDl9A7GEwVe01NYuOs9JA==
X-YMail-OSG: 9PX1dWQVM1kRA7IcAlvjApSC6uV82oV0skHZS83tahcXjOagmjczimTj1PqlBx9
 SzSS8E2feg1OghnCurbuT9H95zoHygOYZ9HKQm4OE.qXohd7eoMEilGsudueKCtc4Q1YLdWdxKJQ
 w8Rlehtk9m2yGllmmCucRASUt5QUh2o2e9Ookbl6AblIrF3QOecq14OGcYliGWy94gVijst9.a0E
 OXlWvniBobtuYcfoJlQG99FnQexkLLSaXflxowkzRWsZ0KDgVKIvVNUqRVYWYU.KSj0K2bDD70cU
 R4jDPH5e7j.nOTyD20CkTRiKuA0A1Rbtso_5PMjP_Y4tUq_P2ZGd6jMipxjTU8OVqkijF2vkgj0Z
 dEFa.DURoRqwlm_DwgdpuLhYTpq7R3kDF_Y4mWnqf7PEueEa1WI0ui4x_Vc0QjUF0xRrCv4Pupi4
 _DGEWvYNHEIH.l9bApdd5Q1Q0vsmMfhupX3OVDSIV3m4mvGVbIqcWUQUmmFx4Hf3vatXnLDhkZNn
 WAfttiWSfIeqlyuFOnoP8cXxm3h90IPFcHxs_EOzusiQtgVny8Ou5XpVLrAdL_bGJ3CW2KAKdJm8
 jAMNEfJd1edaffKRmhKuED1EHtZE7A2Jwr9EyMOrCiSl7QqvRR52jDNZZzJzBJvgVNHD3N7hySwN
 7vnHbFzx.sVeTmduVMORWrF20bub4GF27Uum72UFXu2Mef_IjV0NCX3Oz8k9trXPPPdFlWjAcg6W
 Y8op6pWecppqdb2bi3Pj_oVvhE.tl7eecqDpbzqxPC17Gdup0XPltguwrVoU.4FWkSSEiS6aWkMT
 HTwNYT4kGvfnR.lCzj6yuXAjRVZB40ndffKE7fuKEo3Yf8kzNGj3cipLh7iXG1_tOd8yUZM9w3y6
 E1XTYSAIDqL6RCOV13OM.XntJUZ9gG1J00gjyCEZsyqkUrFDZKQvvXZ4jQqK99vWX.S1DhRtp8Tk
 Yt8sLOQ95GeVBrfIcNR2eAS9gZYaJ9qEJ37.79IBByPA6K7_q2kk24G6FLFyXol1oA.nLgq1xXMs
 Iuk9tqmVpBVckzO3jueao1tliS66yKSwHbqKbSooV1YHNgYT1BwKPT7lGpOZxfOcxF79JY9aOaii
 x.yBiqeRsK4XcxnzNYe4Z0Ffk_1KdzSM.vz5lHl.NuKBKV75onrXC98SErtV.uEUDGMvW9cpMT3R
 tHlpeeod8Hgc9hqCSGmg8cGTPD84UggKq69BBLNdaIgg799xpd5UnzrJUNHIsQR._BLJ7YOm3DiU
 _z7STKEcGizwRDANeziI2TOOemc.T8kZHbenzRe245ufWUiu_ioUgOtW6lV6gf24DUxWN_Mb2LUB
 7GGlfj1bXh38xMGhXlfhmPKHcC9bJDEFs4fwPforzgdMQGui6vyXhDAn5BYIBBfCL4R0tJ4OZePJ
 UJXYefx9esCNccwqxHVzVslY72nXBSzISPRFvM6uOUOQjJtJBn5WX9qHYh1Yz0joKp7T_3Y4MZcR
 3SZVNtu28mqUWJxt.OD_Bt.eqIw8dK7JjrjrPID4a8oueXGmYIETWLgBiuEb_oOi6BhqpqWxE8NO
 Bj2yLvJQozdjN.6U4BoqAzKbfd7nyc2v_CJ.qdoEeRTBwqitqbG1EG4dMd2tpHRuYPi9Q5iIRiMa
 V_zZwLfc5LONP17wjyaEC0TJCFW8SVgDQsA2CKKTWFLqSpNixlFT8FCpw2cnnU6eZhUk1sxC2ITm
 BiaWadFuoDn5ZlbqBLw1EQEkbz2E4NbbLtmgIyf2Khlprm0zNjXtfWI3we4wHoIwl4DwSRXAg0oC
 p8f8hUg_uctlxWwdFp8wDVYoLods_7zRgp9OtV0.ViC8GtQhVbwuID8OquAESlNbU1_O6kve712m
 lRndNM4PUnCGCa4DVLp32_5hmarhIi2f1KtvRzyAtoZkRj3ohdb46x.cle3xn9mP5WzRqyiLR02g
 AR2HnTLHrfhzIGx6uVzDl7o3ju5E0UIL1FL9jq0BFZalzV6K9MGk0ullCBChLWIjiMV6D0CQxkj2
 prd9JQaUtSn3_WhWm7CPbh9DS6LK8UmQpyx_p9cCxB_lGFFKIICJHOFVHh2ZvLlXybGECz8q7xQb
 sTLZuEpd9pkJmLvB7DK6FTRV3pIFaudFmHxatJi92BOXbXo2K531ZZqmMwWc0Mbe81Sa7xVQ8xqc
 h_LtmSs3rdep9348uu4IgsjBAEc9e2BZOaSAJHgyxdk4sRGP4Y6oF8mVlL2u_Qfk.0WCcFDrd6VB
 hCUG50HC5M.n9b254dauf6B8a17IkKE0GEyc1KbJMSvRjH2nT398BaEGOvRvQJJdHOSUK0UD7Sts
 Dt1Tx4SqIH335fSzBCJDTAvaY3jKluDn3oX4-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: c00d73b6-18b2-4096-813c-398f9b2a0bc1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Fri, 16 Oct 2026 01:12:11 +0000
Received: by hermes--production-ir2-5dd9bf4598-fvbwk (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 29a607ffaeb72dc5bc81399c1e82b61e;
          Fri, 16 Oct 2026 01:01:51 +0000 (UTC)
Message-ID: <7bc13c51-6e93-4dd8-bf4d-b65d87fb36e1@yahoo.com>
Date: Fri, 16 Oct 2026 03:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v6 1/9] dt-bindings: net: dsa: realtek: add
 RTL8367S-VB
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5a4715dd-89e0-4868-9ffb-c8fb73b18d04@yahoo.com>
Content-Language: pl
In-Reply-To: <5a4715dd-89e0-4868-9ffb-c8fb73b18d04@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26740 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

The RTL8367S-VB (chip ID 0x6642) is supported by the rtl8365mb driver
with the changes that follow in this series. It is identified by its
chip ID register, so it does not need a compatible string of its own.
List it under realtek,rtl8365mb.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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

