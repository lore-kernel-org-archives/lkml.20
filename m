Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307690;
	b=BOZnlb0lBJ1MgjYfZQrKuB1awikPBVXoVGVZwb//F2POXt8+eQezB9zJ224AduC9R++o
	 5G44HhDvBddRTOCkwtWJ9RhUPZVa8zsYdxMmq3VioLk7uPqclSPeenw4DGwnYiM+/+g40
	 KZACcQf9I96+Td+X6KTbNgOmVyJhyjRWLPvoodoIcAB9Ho6w2vYIR7mLRRz7Qv0a8AkDT
	 NFklMGjfhOglwiv467hkPCmtKk3/2R/3qOPgQwOT/IkKXyinNdZiM6EEu8PXzjnVA1VDy
	 F07VyHVx0Qp7jujalj7UP5cdMhNHaUSniC6o0jksO85/UZDefdhw7Jh8JLK66bykC3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To;
	bh=AsVpshVWUcahAJco6yGQFmBOgaw87iAoLtHAaOYVCFs=;
	b=ZfKj9WvyLa04lmVuTAMWac1tek3iVzQMb5VriT1BqD2N0myiEOGoAVbDAjqYyI3wuM5t
	 3vm9wJfs/EVjhhuHGdMlnDu4ropKwJeBMeZl/VgNEgSE+yy++nVbwob+WNeap4q+mXKO2
	 FrHhUgxWCW9dxWgboYeFwjGpycFAHh2wnDIh4Jz41jJVbvRzpWiyWtU+M37POSZmcLg5O
	 sFYDyEUT3ZM9hJ87KtKSyq5MGJhi+eWtq+ImPP7V4Lwy/bO7qaWw6RbyqRKFyNKR84C5S
	 bYdRpcP757Wmc1Mydj/EuGpU0x9mZyxwzIJRzFg3LtfDi0CBlHJcUbck868dxTMTnyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FJ+yNBRx;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9998E60A260B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9998E60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FJ+yNBRx
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so18336275e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794307688; x=1794912488; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AsVpshVWUcahAJco6yGQFmBOgaw87iAoLtHAaOYVCFs=;
        b=FJ+yNBRxyJI2z7b9ifd1BlWgPyDujuP2bucSCxdd2jMCCs2Vq+y4Fg1q2qXXeVscn9
         EDBeZTKKPxc5cwKpQ1zbptmVdrVEaBhQbEPKjLOB8gDdBVuC6cmkvy9rE9ba1e+7Qkci
         DncEFa7RlS3gf5l8G33OgqHGfOasXBPTLKjqVLP19T4YyGzT5srN2n7zvsO9zQNUemSK
         yIFXayt+0HJrSNQa8igR1kJ6445w0Q7c89bEdbaBgIK2G0a1kkn8yPuiFaQBxYdMuVw3
         dRLQOPVCONqsVm+QcYaSrdtXPjVawC8Ehaf1Eu5PNMDhKdU6bbf5EdA+6oRIbTvo+WFR
         biHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307688; x=1794912488;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsVpshVWUcahAJco6yGQFmBOgaw87iAoLtHAaOYVCFs=;
        b=Exw2s18GZEdOQHiKc7GsgYeWtrf4xPZJ/7yXDKMMZLGXcaCDHBmRCYYjLquZBlosE6
         zYq6racWrb/9n9CEW2TIA6X9VGsKsKlemDq9A1AeRgl0GksGd3QSk40eGOgkr4eco8UA
         ALE7N+S2Gfmo5Yr2BDabVhfd67UzMzqTKDR67ldVOX2w3KXzvroxDWJMui1u0LkDdQWY
         Wk/pCW3t0ZajV3XjuHzddftgL/StHtZds7vNcwtLTYTLG6NMs+4nxjtvFKCjTPPphwqO
         DGcwHTxMxL9j/q781IANlUvi8GRLE/zABawxgrSNKg2PRfRirh+l1mxlHkAP+yXLCDCI
         z4wg==
X-Forwarded-Encrypted: i=1; AL+hErG7zAGQwZt+iHXPPuOW5QsP8zO+YCxc4Wt0iR8pwCWZT/4qkmTD09Lm4V63aDFhhu++bp7+boQAF07pEZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cgCx9V4YJxnEd+OUYQiKMAPk1zFXSeYOqZ3szlq4OzVjF0Z3T
	Pmf1JvR/3eK5izPpAPCptBzc97S19lW+DC0ybfv9PUrzLVBoB2fb1XmWwW/Zr1QgKuQ=
X-Gm-Gg: AYBFou0ui+lsKxHVNTLbymo6L7WzXxvPpor4aGYbvR6DLWf417pLWfqr5ET0OUGiSoQ
	1a+ddXuE8TTfmFIjThtZr+XnDXqu2OyZ8sASPOKSUtmNoSyEXVBbt1ow86sqt3RINPAc+yAoktN
	M1aoj0LB2kj/Tn5VR7Y9git9CRqcUdoWt9OcDs+XriqxMzC1rmi3HWf8gPovgfh4+54eZ4HHhVS
	5gYUd8f31PGBrZhfdnR+qrkbsGCRAu8Yc4omrXLUeb46T4Psu0nAJvFeM1Aw77MJDendbQYSkQr
	VuVrB8czkdJ5h62pH8Bzi0PdJD+Fj3uM6qyRqhVxMuLkBztD+i+dMp+LiC35XPscIzGQ3IuskXR
	lolhaZTEntWUwJyAm5kbTHpuxwazUXWfNq/Xosxgk08EOYDzC2FN7lCDEq1iBZCKU49z1RYrpg7
	+5i+pGjfdbq9hp3C0Z+KwHqxjBOSceuMYlXxqLbiJfFDwbdhzfz8YAA3zeE2+8j/6GzudRj40Zg
	5VLxhvu60oahJX8EZeY5FX852l8ATv3aAmLV9ohIUueC0VPtCaEB39KtkTqzRxLQvkNwhjs2foX
	5ZnL614zuRAT7DqzRU18TubHuLQzRAiCgZrngsK0g1pOyQJhm/Gu9CENXRV7kJFV1riJBQjr
X-Received: by 2002:a05:600c:348d:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4ba023051a5mr35822815e9.1.1794307687833;
        Tue, 10 Nov 2026 02:48:07 -0800 (PST)
Received: from ?IPV6:2001:a61:1365:2501:d97e:4bec:d495:3c3f? ([2001:a61:1365:2501:d97e:4bec:d495:3c3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204ee67sm57409875e9.13.2026.11.10.02.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 02:48:07 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------lieuYdQrnBx6m16xWGNncEST"
Message-ID: <a26ce7f8-e2df-4d1b-a22f-1787126ca989@suse.com>
Date: Tue, 10 Nov 2026 11:48:04 +0100
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
Subject: Re: [PATCH net] net: usb: rtl8150: fix rx tasklet use-after-free on
 disconnect
To: Myeonghun Pak <mhun512@gmail.com>, Petko Manolov <petkan@nucleusys.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
References: <20261110043016.56986-1-mhun512@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261110043016.56986-1-mhun512@gmail.com>

This is a multi-part message in MIME format.
--------------lieuYdQrnBx6m16xWGNncEST
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.11.26 05:30, Myeonghun Pak wrote:

Hi,

> Kill the tasklet again after unlink_all_urbs() has waited for all
> completion handlers. tasklet_kill() drains any late tasklet and prevents
> self-rescheduling; disabled endpoints prevent it from leaving an RX
> URB in flight. Keep the first kill to stop an existing reschedule loop
> before unregister_netdev().
> 
> Found by a static analysis tool under development.

Good catch; nice tool.
But the fix is not correct.

> Fixes: eff674a514bd ("USB: rtl8150_disconnect() needs tasklet_kill()")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> 
> ---
> 
>   drivers/net/usb/rtl8150.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index d51e43170e03..98c36c377956 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -971,6 +971,8 @@ static void rtl8150_disconnect(struct usb_interface *intf)
>   		tasklet_kill(&dev->tl);
>   		unregister_netdev(dev->netdev);
>   		unlink_all_urbs(dev);
> +		/* A completion may have scheduled it after the first kill. */
> +		tasklet_kill(&dev->tl);

The tasklet, however, can also submit the URB again, which in turn
can submit the tasklet and so on. There is an unavoidable window
in that sequence, as tasklet_kill() will kill the tasklet, but it may
have run in the window.

Hence you need to also, in addition to your patch, actually prevent the
resubmission of the URBs. The attached fix will do so.

How do we do this? Shall I submit? Do you want a joint submission?

	Regards
		Oliver

--------------lieuYdQrnBx6m16xWGNncEST
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-net-usb-rtl8150-break-cycle-between-tasklet-and-URB.patch"
Content-Disposition: attachment;
 filename*0="0001-net-usb-rtl8150-break-cycle-between-tasklet-and-URB.pat";
 filename*1="ch"
Content-Transfer-Encoding: base64

RnJvbSBjOGI4OGQ0NWNhZWYwYzJmZGZhMGIxYTUxZjc3YzJkYjU2NzY1OGJmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUdWUsIDEwIE5vdiAyMDI2IDExOjI2OjM0ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gbmV0OiB1c2I6IHJ0bDgxNTA6IGJyZWFrIGN5Y2xlIGJldHdlZW4gdGFza2xldCBhbmQg
VVJCCgpUaGUgdGFza2xldCBjYW4gcmVzdWJtaXQgdGhlIFVSQiwgd2hpY2ggaW4gdHVybiBj
YW4KcmVzdWJtaXQgdGhlIHRhc2tsZXQuIFRoZSBjeWNsZSBuZWVkcyB0byBiZSBicm9rZW4K
dGhlIHNpbXBsZXN0IHdheSB0byBkbyBzbyBpcyB0byBwcmV2ZW50IHRoZSByZXN1Ym1pc3Np
b24Kb2YgdGhlIFVSQnMgYnkgcG9pc29uaW5nIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBPbGl2
ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvbmV0L3VzYi9ydGw4
MTUwLmMgfCAxNiArKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC91c2Iv
cnRsODE1MC5jIGIvZHJpdmVycy9uZXQvdXNiL3J0bDgxNTAuYwppbmRleCBkNTFlNDMxNzBl
MDMuLjYzNWU2NWEwZGU0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvdXNiL3J0bDgxNTAu
YworKysgYi9kcml2ZXJzL25ldC91c2IvcnRsODE1MC5jCkBAIC0zNTMsMTEgKzM1MywxOCBA
QCBzdGF0aWMgdm9pZCBmcmVlX2FsbF91cmJzKHJ0bDgxNTBfdCAqIGRldikKIAl1c2JfZnJl
ZV91cmIoZGV2LT5pbnRyX3VyYik7CiB9CiAKK3N0YXRpYyB2b2lkIHJlZW5hYmxlX2FsbF91
cmJzKHJ0bDgxNTBfdCAqIGRldikKK3sKKwl1c2JfdW5wb2lzb25fdXJiKGRldi0+cnhfdXJi
KTsKKwl1c2JfdW5wb2lzb25fdXJiKGRldi0+dHhfdXJiKTsKKwl1c2JfdW5wb2lzb25fdXJi
KGRldi0+aW50cl91cmIpOworfQorCiBzdGF0aWMgdm9pZCB1bmxpbmtfYWxsX3VyYnMocnRs
ODE1MF90ICogZGV2KQogewotCXVzYl9raWxsX3VyYihkZXYtPnJ4X3VyYik7Ci0JdXNiX2tp
bGxfdXJiKGRldi0+dHhfdXJiKTsKLQl1c2Jfa2lsbF91cmIoZGV2LT5pbnRyX3VyYik7CisJ
dXNiX3BvaXNvbl91cmIoZGV2LT5yeF91cmIpOworCXVzYl9wb2lzb25fdXJiKGRldi0+dHhf
dXJiKTsKKwl1c2JfcG9pc29uX3VyYihkZXYtPmludHJfdXJiKTsKIH0KIAogc3RhdGljIGlu
bGluZSBzdHJ1Y3Qgc2tfYnVmZiAqcHVsbF9za2IocnRsODE1MF90ICpkZXYpCkBAIC01MTgs
NyArNTI1LDcgQEAgc3RhdGljIHZvaWQgaW50cl9jYWxsYmFjayhzdHJ1Y3QgdXJiICp1cmIp
CiAJcmVzID0gdXNiX3N1Ym1pdF91cmIgKHVyYiwgR0ZQX0FUT01JQyk7CiAJaWYgKHJlcyA9
PSAtRU5PREVWKQogCQluZXRpZl9kZXZpY2VfZGV0YWNoKGRldi0+bmV0ZGV2KTsKLQllbHNl
IGlmIChyZXMpCisJZWxzZSBpZiAocmVzICE9IC1FUEVSTSkKIAkJZGV2X2VycigmZGV2LT51
ZGV2LT5kZXYsCiAJCQkiY2FuJ3QgcmVzdWJtaXQgaW50ciwgJXMtJXMvaW5wdXQwLCBzdGF0
dXMgJWRcbiIsCiAJCQlkZXYtPnVkZXYtPmJ1cy0+YnVzX25hbWUsIGRldi0+dWRldi0+ZGV2
cGF0aCwgcmVzKTsKQEAgLTc1MSw2ICs3NTgsNyBAQCBzdGF0aWMgaW50IHJ0bDgxNTBfb3Bl
bihzdHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2KQogCWlmICghZGV2LT5yeF9za2IpCiAJCXJl
dHVybiAtRU5PTUVNOwogCisJcmVlbmFibGVfYWxsX3VyYnMoZGV2KTsKIAlzZXRfcmVnaXN0
ZXJzKGRldiwgSURSLCA2LCBuZXRkZXYtPmRldl9hZGRyKTsKIAogCXVzYl9maWxsX2J1bGtf
dXJiKGRldi0+cnhfdXJiLCBkZXYtPnVkZXYsIHVzYl9yY3ZidWxrcGlwZShkZXYtPnVkZXYs
IDEpLAotLSAKMi41Ni4wCgo=

--------------lieuYdQrnBx6m16xWGNncEST--
