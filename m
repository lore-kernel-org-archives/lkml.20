Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358667;
	b=vSCFpDXoGUBIhwV9cXiZpf2Od8LzLBhTqm6jENI5720ylxnUHeqxow2HY/8Ea+TNC1np
	 SZytYuxxOCD/prDn2UUbVWK/BJmjFdY0bCv3Oxihx50ihg/EekUurECJYzdQUqw0l14L0
	 aAdJH6JSxidsOmfMgWjI4cjo7Tws2XlMAznM3o16TBLrzZNuuZZ3DQYW/uDd74EHpYVln
	 HXSYIFfz2zAcIDMOK2+lnVHYUz54SVMQAzgesjRcTmtgtoivTGtvlO2nbpXKPvUuXJL+f
	 E1Au2cydi51PrJa0jK1cQifFKfaZXebWH8I4DDSagtTS7eU4uoKeOCh3lEH6rOeFuQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+WghCCVj/g7O1H6Bv64tZFo0L+kNuS7zgljqJhCtvfE=;
	b=iKNv0UU6hTd1Q3nGmvNJ2j+xJ2677R3JfJ4zlhFLoCksZZRVPtRwLC08Ad5HDs1pZcX8
	 8Jaj6nYJNWYMuOburBEHgNzrBpXTnPtV3VwSgWoIeyKzamFPqvtKVymjIXY5trBc0c+gS
	 WQfYgu5vmV8c4T4MxbV6Uhc984zKYmjjQ7HG9eaoNL97qep2CfBcvCKIz6dSi3WU+iyrB
	 SVXo27IUTfOyDtvYA7ek1UlNYsYeStJ249+wVtQyFOotfo3UTJN+eLlKPkgP1CdWIZkoB
	 bp2RbpEzN78I5SjUcOVH9PPMYH/NaSemeon3SHPqV47zxD+Oa0xcVU/41eeB62+fc0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsZq87Nc;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9588F60A260A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9588F60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsZq87Nc
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98c6e050c5dso315155241.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358665; x=1793963465; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+WghCCVj/g7O1H6Bv64tZFo0L+kNuS7zgljqJhCtvfE=;
        b=jsZq87NcQfTZpaVK69QLYee3ckZ37vLXsRiXIosB9EJM2g0zFCXwWJAOd68DGuPHaS
         LfK3N3M1jYLIExY9JTp8RfnYngWVpuPMKV3hBIfQax9b43PrZHgYsbdbvZ7yjThJzVlv
         5F99iF1S2TCF/Qxgn9e3YVLL632hAD8Gv+2/RE6LJYyYiJ7S2Zi0cbRo9GsoquIquPJL
         aFEAv7dPVqJX8OwLQzfAMzHutxscUmMHHRzCqoaSRZN4fg+kD86oHe3oAYqJp1wuNKBY
         8zV5KFQmJ62hKDVeUtg7nPh6/xMPSOHf+JsfDb8CJBEuXbnn0Rt607qZxGeV9oqoTFRJ
         gSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358665; x=1793963465;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WghCCVj/g7O1H6Bv64tZFo0L+kNuS7zgljqJhCtvfE=;
        b=qfaDL3qfU2RsognutpcCrRbyoIujqcoJLv4YE3rBlCfZZjwdQ80EcWLP6+5jW+jQFq
         +H3GHSxfQ8VLyCJhctBK0DeiPf6kPXYplt1ZMozfHshpduG5jJgWP9QPzs22vimBlkDh
         w9CU7w2RCANhhAHHwc1FaLZ8qJSQZoz/YmPe7TGH7JCG9bES8wgtqtoctHzP4rPFoLjy
         yJHNzeUEZ6ySPlK7jq7fFvXfjqSO3J1vvKaaBXjSVpSxpWfwMKrc7ASFf9/vZll8N8BB
         oGNtfuLfSsPjAzJ091u8eqVnOa3oeHZgQdhIcY2LPMPT49/nPKnaVGPALCLdE5gGus0h
         p+2w==
X-Forwarded-Encrypted: i=1; AKwUvBzfR5OAHBwKsHl9byH4RJnqsWRL5DQK6pW9OSWL6IL9P9tmiZ/dofggFYczvM+uCZSBo0lOY4elb3bKBfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ7rv/FrLyDsc05q6svSyida1CR0bBmKKOeLDGRkCq87eCS2vL
	Iu/c9229df1hw+rYqiwBHguGjEexjduZ65ku4CqTvaFikjJyVqI3YQdY
X-Gm-Gg: AYBFou3DtCZHuIu+NSnicvQj/YDwWm2085Q5fEzdyzRcM0vbc/v1smHEzlCsvYsj+ol
	Sk8t/XYpbWI4aaz9POd0vylsPlSkfHPlVxV+EgISF39GddkxE2nrgDHzsaDGT1pq0sJgJaSlN91
	irrUYEhvklOCultap2S0jU17Gjs8m56piInnwueutBTsALIWvQ881lSS18Ti8LJ9uXGTQdyQ8U2
	lAo8KYqwndhBCOpNM543NjYbYpcyaekj2hUdOGJ5Go5UXKWqkH7hBjpSeK8Ai6eZ+yhmZPIE3Cp
	wM3qJKf7eCl5vmQn2xB9L8blz4zpgCrbJLXDtv35PDVRs7CawBjn4eelomLwqssTM7OKC5h1Wfa
	8MPoK36MbyWICNT/qyi5/ruQ6lcgw0hEACz4H3UfwXoFub7MSmPxRszI6BOaIT7M5Gr+X1ShqEn
	1zkVpAsccMCA3md+bHvYMkPP+6Yja4iBifUuDZ9HwcIfPq8af5usVp7PTpzwyjoUYX1uRnYm4PU
	RTDznWCWJGmV20dc8s+mDfwRG6DdC4sIHaxTYIo5sCWksNMc/t8idiVZSD0QNuu00zF6zp7itBO
	QYZkKopCGk7UVlBeYsJC60j03NWn6PAT2poxgBwaMIyVS/OeOfvj4tS314cVoJQwecfAAjBwYNy
	WvTKZRETaNCZIFuI8Y1rDmu82CLs5ntPHOoHUrLgw
X-Received: by 2002:a05:6102:2b85:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d0723d2480mr1002923137.0.1793358665428;
        Fri, 30 Oct 2026 04:11:05 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([191.34.116.20])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm1841044137.4.2026.10.30.04.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:11:05 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] nfc: rawsock: free the response skb when the data
 exchange fails
Date: Fri, 30 Oct 2026 08:10:42 -0300
Message-ID: <179335864272.64596.4931238314416806197@gmail.com>
In-Reply-To: <179335864271.64596.805818095553030218@gmail.com>
References: <179335864271.64596.805818095553030218@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

rawsock_data_exchange_complete() only frees the skb it is given when
the exchange succeeded.  But the skb can carry the response even when
err is set: the HCI core passes it on with the error derived from the
controller's result code (__nfc_hci_cmd_completion() gives it to the
callback and does not free it, and hci_transceive_cb() and the pn544,
st21nfca and microread data exchange callbacks forward it as is), and
NCI does the same for a frame interface data packet with a non-zero
status byte.  So each failed exchange on a raw socket leaks an skb, and
a controller or tag that keeps failing exchanges leaks memory without
bound.

This was found by LLM-assisted code review.

Free the skb on the error path too; it is NULL when the error does not
come with a response (digital, timeouts, device close), and
kfree_skb() handles that.

Fixes: 23b7869c0fd0 ("NFC: add the NFC socket raw protocol")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/rawsock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
index f7d7a599f..74ef3906c 100644
--- a/net/nfc/rawsock.c
+++ b/net/nfc/rawsock.c
@@ -156,8 +156,9 @@ static void rawsock_data_exchange_complete(void *context, struct sk_buff *skb,
 
 	pr_debug("sk=%p err=%d\n", sk, err);
 
+	/* skb may carry the response even when the exchange failed */
 	if (err)
-		goto error;
+		goto error_skb;
 
 	err = rawsock_add_header(skb);
 	if (err)
@@ -180,7 +181,6 @@ static void rawsock_data_exchange_complete(void *context, struct sk_buff *skb,
 error_skb:
 	kfree_skb(skb);
 
-error:
 	rawsock_report_error(sk, err);
 	sock_put(sk);
 }
-- 
2.43.0

