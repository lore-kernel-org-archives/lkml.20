Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936377;
	b=ZAX4kNEE7lzhQKnj6YPxyluCVmHImRNauQlZqlkMQidHLAzdV5Dmsuzgj5peMLueo+nU
	 hcnUTKe2fWPc17gM5vP9zDmRZDQo/yLEkY/wv+3AffHqDLw1RBxBgA8ZjB23c3+OrYVNL
	 EqEWqOjqZLg9vb8ws5rR68ukJO+sEKxV8dLvmjsO7/aNDzPS2Jsmqq79xGL1fDDqBHMHM
	 IaOaeTNwpbSz06XINzL+j4KHuYD4J6ouqyXq/yF+Y17QGBlbTkS6OyRqpDql9oWlMs2hm
	 wN4leg/GXOKBgfDWjRQqsAPGk8XfOnOIPzfJ4NEA/gCf8CVXyQYwWqyFWcwp7Ux7sEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936377;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Date:From:To:Cc:Reply-To:
	 Message-ID:Subject:X-Mailer:MIME-Version:x-aliyun-im-through:
	 References:x-aliyun-mail-creator:In-Reply-To:x-aliyun-mailtrack:
	 Content-Type:Content-Transfer-Encoding;
	bh=ylNb4lyoDnDVbeVYjsPUy5/EMBQ+X4muWILrXlRvMxo=;
	b=toUUreB8AxBpuPGmoCj+DXeBNNOAhyR3bd2KP0iRO/1VQJ9TX8NJiZlzN7oBL5RhMIze
	 dHx+HmNuenHVnuBrZFcfzrlUcDsQISJu1xaHFEtBKqfmcSvTBDn0hWuyTiVrPaVMQ/Nid
	 9gY5JgQkzsr3CyosLldOWn1oMSgiC99VNzGKAQJwYxHWS5ufGaTEbj6dcK7XF3/hVD7TY
	 rXjrXami4s0Eusw62j2SiovpafJi/JiERXN0NLIzEUPnR/eUtreEZN/+FpS6zifzWRpFt
	 feomNYlFKNw+N2qucZWSh6SC82djgsmvy2p7KdvTTVTLWw0IWXQdZr+JV9Dyk6oQLwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.147
Received: from out28-147.mail.aliyun.com (out28-147.mail.aliyun.com [115.124.28.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9430606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9430606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1308854|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.00454194-0.000177499-0.995281;FP=8458208776405753275|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=liaoxuan@open-hieco.net;NM=1;PH=DW;RN=9;RT=9;SR=0;TI=W4_0.2.3_v5ForWebDing_211855CA_1793935086753_o7001c533;
Received: from WS-web (liaoxuan@open-hieco.net[W4_0.2.3_v5ForWebDing_211855CA_1793935086753_o7001c533] cluster:ay29) at Fri, 06 Nov 2026 11:39:26 +0800
Date: Fri, 06 Nov 2026 11:39:26 +0800
From: "=?UTF-8?B?5buW54WK?=" <liaoxuan@open-hieco.net>
To: "Bjorn Helgaas" <helgaas@kernel.org>
Cc: "kbusch" <kbusch@kernel.org>,
  "axboe" <axboe@kernel.dk>,
  "hch" <hch@lst.de>,
  "sagi" <sagi@grimberg.me>,
  "linux-nvme" <linux-nvme@lists.infradead.org>,
  "linux-kernel" <linux-kernel@vger.kernel.org>,
  "default avatarZheng Tan" <tanzheng@kylinos.cn>,
  "=?UTF-8?B?SWxwbyBKw6RydmluZW4=?=" <ilpo.jarvinen@linux.intel.com>
Reply-To: "=?UTF-8?B?5buW54WK?=" <liaoxuan@open-hieco.net>
Message-ID: <d20d0f7a-6296-43e7-b27e-5a1ea3ae0607.liaoxuan@open-hieco.net>
Subject: =?UTF-8?B?5Zue5aSN77ya5Zue5aSN77yaW1BBVENIIDEvM10gbnZtZTogQWRkIGFkYXB0aXZlIFBDSWUg?=
  =?UTF-8?B?bGluayByYXRlIHN3aXRjaGluZyBmdW5jdGlvbg==?=
X-Mailer: [Alimail-Mailagent][W4_0.2.3][v5ForWebDing][Chrome]
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
x-aliyun-im-through: {"version":"v1.0"}
References: <5453bf57-fd19-458b-a723-bc7ab99c2479.liaoxuan@open-hieco.net>,<20261105192228.GA1550766@bhelgaas>
x-aliyun-mail-creator: W4_0.2.3_v5ForWebDing_SFRTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzE1Ni4wLjAuMCBTYWZhcmkvNTM3LjM2IEVkZy8xNTYuMC4wLjA=Ch
In-Reply-To: <20261105192228.GA1550766@bhelgaas>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgQmpvcm4sCgpUbyBpbXByb3ZlIGdlbmVyYWxpdHkgYW5kIG1ha2UgdGhlIGFzc3VtcHRpb24g
ZXhwbGljaXQsIEkgd2lsbCBmb2xsb3cKeW91ciBzdWdnZXN0aW9uOiBJIHdpbGwgZW5jYXBzdWxh
dGUgdGhlIHRocmVzaG9sZCBjYWxjdWxhdGlvbiBmbG93IGluCmEgc2VwYXJhdGUgZnVuY3Rpb24s
IGFuZCBhZGQgYSBjb21tZW50IHRoZXJlIHN0YXRpbmcgdGhhdCB0aGlzIHBhcmFtZXRlcgppcyBw
bGF0Zm9ybS1kZXBlbmRlbnQgYW5kIHRoYXQgdGhlIGN1cnJlbnQgdmFsdWUgaXMgZm9yIEh5Z29u
IHBsYXRmb3Jtcy4KSSB3aWxsIHNlbmQgYW4gdXBkYXRlZCBwYXRjaCB3aXRoIHRoaXMgY2hhbmdl
LgoKVGhhbmtzLApMaWFvIFh1YW4KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCuWPkeS7tuS6uu+8mkJqb3JuIEhlbGdhYXMg
PGhlbGdhYXNAa2VybmVsLm9yZz4K5Y+R6YCB5pe26Ze077yaMjAyNuW5tDEx5pyINuaXpSjlkajk
upQpIDAzOjIyCuaUtuS7tuS6uu+8miLlu5bnhYoiPGxpYW94dWFuQG9wZW4taGllY28ubmV0Pgrm
ioTjgIDpgIHvvJprYnVzY2g8a2J1c2NoQGtlcm5lbC5vcmc+OyBheGJvZTxheGJvZUBrZXJuZWwu
ZGs+OyBoY2g8aGNoQGxzdC5kZT47IHNhZ2k8c2FnaUBncmltYmVyZy5tZT47ICJsaW51eC1udm1l
IjxsaW51eC1udm1lQGxpc3RzLmluZnJhZGVhZC5vcmc+OyAibGludXgta2VybmVsIjxsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgZGVmYXVsdCBhdmF0YXJaaGVuZyBUYW48dGFuemhlbmdA
a3lsaW5vcy5jbj47ICJJbHBvIErDpHJ2aW5lbiI8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5j
b20+CuS4u+OAgOmimO+8mlJlOiDlm57lpI3vvJpbUEFUQ0ggMS8zXSBudm1lOiBBZGQgYWRhcHRp
dmUgUENJZSBsaW5rIHJhdGUgc3dpdGNoaW5nIGZ1bmN0aW9uCgoKT24gVGh1LCBOb3YgMDUsIDIw
MjYgYXQgMDI6MzA6MTNQTSArMDgwMCwg5buW54WKIHdyb3RlOgo+IEhpIEJqb3JuLAo+IFRoYW5r
IHlvdSBmb3IgdGhlIHJldmlldyBhbmQgZm9yIHRoZSBxdWVzdGlvbi4KPiAKPiBUaGUgcmVhc29u
IGZvciByZXN0cmljdGluZyB0aGlzIGZlYXR1cmUgdG8gSHlnb24gcGxhdGZvcm1zIGlzIHRoYXQg
dGhlCj4gUENJZSBsaW5rIHJldHJhaW5pbmcgdGltZSB2YXJpZXMgYWNyb3NzIGRpZmZlcmVudCBD
UFUgcGxhdGZvcm1zLgo+IAo+IEluIHRoaXMgcGF0Y2gsIHRoZSBJL08gdGhyZXNob2xkIGZvciBk
b3duZ3JhZGluZy91cGdyYWRpbmcgdGhlIGxpbmsgcmF0ZQo+IGlzIGRlcml2ZWQgYmFzZWQgb24g
dGhpcyByZXRyYWluaW5nIHRpbWUuIEN1cnJlbnRseSwgaXQgaXMgaGFyZGNvZGVkIGFzCj4gMTAw
dXMgaW4gbnZtZV9jYWxjX3NwZWVkX3RocmVzaG9sZCgpLCB3aGljaCBpcyB0aGUgdmFsaWRhdGVk
IHZhbHVlIGZvcgo+IEh5Z29uLiBTaW5jZSB3ZSBoYXZlIG9ubHkgdmVyaWZpZWQgdGhpcyB0aW1p
bmcgcGFyYW1ldGVyIG9uIEh5Z29uIHBsYXRmb3JtcywKPiB3ZSBhZGRlZCB0aGUgcmVzdHJpY3Rp
b24gdG8gYXZvaWQgcG90ZW50aWFsIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb25zIG9uCj4gb3RoZXIg
cGxhdGZvcm1zIHdoZXJlIHRoZSByZXRyYWluaW5nIHRpbWUgbWlnaHQgYmUgZGlmZmVyZW50LgoK
U2VlbXMgc3VzcGVjdCB0byBoYXJkLWNvZGUgcGxhdGZvcm0gcGFyYW1ldGVycyBsaWtlIHRoaXMs
IGJ1dCBpZiB5b3UKbXVzdCwgYXQgbGVhc3QgYWRkIGEgY29tbWVudCB0byB0aGUgZWZmZWN0IHRo
YXQgdGhpcyBkZXBlbmRzIG9uIHRoZQpwbGF0Zm9ybSBhbmQgdGhlIGN1cnJlbnQgdmFsdWUgaXMg
Zm9yIHBsYXRmb3JtIFguCg==
