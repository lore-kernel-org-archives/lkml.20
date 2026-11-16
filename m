Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841910;
	b=1YHFFh0Pvd/qrCiY1I0MyWF3xei+n4XHiBpWXgFpGw+1VV24YIMHcI4jfcvi+LHqHO1R
	 bpXnnsdLxde0dUMMDOjzTE1O1ZjASp5YX0UTbovwhphXgyzpWrDD1pW7EHCsEk59Dge0P
	 lelAlwdtmR/vGJGsZ69igFQV+1AsnOgxlFqqKK59HXjzAP6hUjbRWrGEMi/X51z+eskH+
	 q5zuCZqlPV4GpdLRQzeWfeQCDLD4lQUbMGvSeirMFqJVQgyYkLY0/wEKmnM6c4Lp3qhLO
	 zD49oIc3TzMRNGQYrysWf2GEsqqsyc/F4vzSR2DfsZo/ip+Qap0ztXJCNUhMypsrlxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841910;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=k3wjoXPfdYoH26BVWO3+cw76m8FT5NmjFkdWFdobGv4=;
	b=fmOcJN1gwFKpVU7kV+MtquXBj/3KQcWVbmTlA0kkVr5y+yUGbJsHFFcHGovBoTvTwKYF
	 Ngi4R+zz5mv9/OZ8Rg56eIbtbXr/w5lzckIxjQzYWzBtlqVukY+zP+LKw2ZsmDexoOmVG
	 SB0hYN62sZvEMzlLjLP7PbR2zQIsY/I9N9skgKq721LHbObE9Wz7Qyl/BEV/yvmG6ZEM7
	 kTAfclpz111g8LLhy8hxdzTSHDH3AvwVH9Uvn1FHs1hCTN4Ob3r2XjYniq5ZphS9pikhH
	 hvsXZ2WeT6wd0l8hT8x8sq6gqjwJ/NFqE9/aYLlwRKaKMytukkm56f5qthVp+0WZjPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=P6es5K0B;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3006B606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3006B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=P6es5K0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794841905; bh=k3wjoXPfdYoH26BVWO3+cw76m8FT5NmjFkdWFdobGv4=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=P6es5K0BZwtv8hMmKItvJ6Bm0mQIhFLeCzPZyRREgDgLMdOH0P+i/M03fp8zfsnS+
	 eNGr3Z/nFkjoIGTSJKXfHAw4U/YdBFNDhGKtW6UojbRp4x+P4RnOJ91EkbOnDkcDZR
	 Wu9+0g5WeXubLQNVsUeM2KBpLofZCn8wvAQq2dwM=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-XMAILINFO: N55iztL8edgQvN0v5JGUgkPqXum1H/JEX8chapWGgvcpkKr/b21ELtNOyEdmlM
	 t2Ss/HHlHdNl09w2GkccrfHlVek5Hr327J2k5O2pfKE0e3jieSFBKD9ATUn4wF3IH/yb2Rntu7TFp
	 WXm5k0hlGYKwxl1uL9czFZFsGSjq/0nI5xfRoqexTLgEzt5+vRcbMBJCAv0jwWeRskC/qHUaFD2om
	 giLcX0UafcBok9fRKpWypOekoGvYlbISbOu0Y1rEtSf6GQ88i2qx1DycCNNAU9fRch3pP7jVWT1lI
	 AXczut/A/6blFfthX49WeF0Eku9mA2NKjvG+fVc+u3v325NZb635H60VBFXAwRmuzD1X4Ewtn89T7
	 eSRinH6r+1lnCc/s3HTjxSGosXICIGZsdA/c2NsLbdFRaq13z1J8jOSfX3XIxt9gaHOvPHE7MrowT
	 R/7vQV+R1TJCj68QHoopG6fwdQIO7DaLceTq9QM3CxqCN0PIdSDxbD3lfiXaNlIcjcwlPtBHhmTaK
	 0bUxCd+1OwXG9BACryzD3tt7jVRenVmqVAz9pGfEIln9qoBZZyKhTh0zNFmELXf34LKDl5+wWP1EA
	 jg6VTKx1Qof9JczdcZ3ceoWV/kZ5yefg8UriRIoweWbOxdzIViLK96hpSWyCDCxCSAPJg+ahpZnhV
	 aFZvGr+wjPNK2unDlIsAGnp+hf+X1VIe1Yn9AasJ5zIhwNnFSxt1Vdbea+gHFVK2RRm8zIVlnP4tx
	 aJXIeCUWwlVmS5hoba83KO5O/0UQcjEK5f6D08xhQUpM8W3ACZGbgMOasj5v9i5/BDh5u26DBFWVQ
	 Zq/MryA/TfMrEMkV+Q8Eu6SO7nPAXa00pOVy/QMrybrCGwV86vV3Aatf69lW1rX31yZOiNkqRDdOW
	 aUgMzU6Sv8AWEHYxPbXpgSa4srkwhoS8FKMojcBvCFYVh1o5OzFLBroxc920eFp/cXn6meUo+MCKE
	 EMkyKcI++AVByQxb+h3oR4+dtvJLHI82V5EkozsjeyMLRb6EUnZ6ysgJxbMX9jol4LrAujVYffWoM
	 RnUWUfu+qhoZXC+/qPy1u5iXmJJPd+1GfAKz71UTZRFgrykU=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?QW5kcmV3IEx1bm4=?=" <andrew@lunn.ch>
Cc: "=?utf-8?B?QW5kcmV3IEx1bm4=?=" <andrew+netdev@lunn.ch>, "=?utf-8?B?RGF2aWQgUy4gTWlsbGVy?=" <davem@davemloft.net>, "=?utf-8?B?RXJpYyBEdW1hemV0?=" <edumazet@kernel.org>, "=?utf-8?B?SmFrdWIgS2ljaW5za2k=?=" <kuba@kernel.org>, "=?utf-8?B?UGFvbG8gQWJlbmk=?=" <pabeni@redhat.com>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?RGF2aWQgV3U=?=" <david.wu@rock-chips.com>, "=?utf-8?B?QWxleGFuZHJlIFRvcmd1ZQ==?=" <alexandre.torgue@foss.st.com>, "=?utf-8?B?R2l1c2VwcGUgQ2F2YWxsYXJv?=" <peppe.cavallaro@st.com>, "=?utf-8?B?Sm9zZSBBYnJldQ==?=" <joabreu@synopsys.com>, 
	"=?utf-8?B?TWF4aW1lIENoZXZhbGxpZXI=?=" <maxime.chevallier@bootlin.com>, "=?utf-8?B?TWF4aW1lIENvcXVlbGlu?=" <mcoquelin.stm32@gmail.com>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtc3RtMzI=?=" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-rk: Add RK3572 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 16 Nov 2026 23:11:42 +0800
X-Priority: 3
Message-ID: <tencent_273206094323A701D688217E3A4D72341C08@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
 <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
	<f8d4b637-1818-419c-ac51-fb2ded1f9b3e@lunn.ch>
In-Reply-To: <f8d4b637-1818-419c-ac51-fb2ded1f9b3e@lunn.ch>
X-QQ-mid: xmsezb41-0t1794841902tc50bzb2f

SGksCgo+IFsuLi5dCj4gPiArIC5yZWdzX3ZhbGlkID0gdHJ1ZSwKPiA+ICsgLnJlZ3MgPSB7
IDB4MjlkMjAwMDAsIDB4MmEwNDAwMDAsIDAgfSwKPiA+ICt9Owo+Cj4gSnVzdCBsb29raW5n
IGF0IHRoaXMsIGl0IGlzIG5vdCBvYnZpb3VzIHRoYXQgcnhfZGVsYXkgYW5kIHR4X2RlbGF5
IGFyZQo+IGFjdHVhbGx5IG5vdCB1c2VkLgoKTXkgYm9hcmQgY3VycmVudGx5IHVzZXMgcmdt
aWktaWQsIHdoZXJlIGJvdGggTUFDIFRYIGFuZCBSWCBkZWxheXMKYXJlIGRpc2FibGVkLiBJ
IGtlcHQgdGhlIGRlbGF5IGhhbmRsaW5nIHRvIHN1cHBvcnQgcmdtaWktcnhpZCwKcmdtaWkt
dHhpZCBhbmQgcmdtaWksIHVzaW5nIHRoZSBkZWZhdWx0IHZhbHVlcyBmb3IgdGhlIE1BQyBk
ZWxheXMKZW5hYmxlZCBpbiB0aG9zZSBtb2Rlcy4gVGhlIGxlZ2FjeSB0eF9kZWxheSBhbmQg
cnhfZGVsYXkgcHJvcGVydGllcwphcmUgbm93IGRpc2FsbG93ZWQgZm9yIFJLMzU3MiBpbiB0
aGUgYmluZGluZy4KCkkgY3VycmVudGx5IGhhdmUgb25seSBvbmUgb3NjaWxsb3Njb3BlLCB3
aXRoIGEgbWF4aW11bSBiYW5kd2lkdGggb2YKMjAwIE1Iei4gV2l0aCB0aGlzIGVxdWlwbWVu
dCwgSSBjYW5ub3QgYWNjdXJhdGVseSBkZXRlcm1pbmUgaG93IHRoZQpUWCBhbmQgUlggZGVs
YXkgcmVnaXN0ZXIgdmFsdWVzIHRyYW5zbGF0ZSB0byBwaWNvc2Vjb25kcywgc28gSSBhbQpu
b3QgcGxhbm5pbmcgdG8gYWRkIHN1cHBvcnQgZm9yIHR4LWludGVybmFsLWRlbGF5LXBzIGFu
ZApyeC1pbnRlcm5hbC1kZWxheS1wcyBpbiB0aGlzIHNlcmllcyBmb3Igbm93LgoKV291bGQg
aXQgYmUgYWNjZXB0YWJsZSB0byBzdXBwb3J0IG9ubHkgcmdtaWktaWQgZm9yIFJHTUlJIGlu
IHRoZSBuZXh0CnZlcnNpb24sIGFuZCByZWplY3QgcmdtaWksIHJnbWlpLXJ4aWQgYW5kIHJn
bWlpLXR4aWQ/IFRoaXMgd291bGQgbGV0IG1lCnN0b3AgdXNpbmcgdHhfZGVsYXkgYW5kIHJ4
X2RlbGF5IGluIHRoZSBSSzM1NzIgZHJpdmVyIHBhdGggYXMgd2VsbC4KCkJlc3QgcmVnYXJk
cywKQ3VuaGFvIEx1

