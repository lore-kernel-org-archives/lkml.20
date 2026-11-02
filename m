Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656872;
	b=IEERA0h7cWP8Fj06u4WwVEMn1GJ93COw+Bp2GS1uF0+0YeYqFz7zja0/oB0vji1TRf5L
	 mkoBWWuvDlC7UarcT0dlLgctUSBLAdAKNhA/s1vNQqdBs4CDlXPQnjGukOImG9I94J7KD
	 jHLw+TdLZYfY735bItMSdEYQ152iQ5RTQv5dS3I72jm+bVPPqfi4uxFAvtJxcQQdX2Gbz
	 Nc1FxFT2kYl22CXfgdYzBfJIiis9Ofrlqm+YIVboxi+ROKoeM/r6TKpa/qu2FLyBcLRk6
	 yHACRbj2oOmYSL0ZAtgoTTSbqZMcpczweicAeRsU5bXjNyw1eq5BZOMBcIPXpTFHbWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656872;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
	b=rFvOAvPD5fL+hcGcBVG3hdz08rQV8zGlKRyw0YhP9Ym2O6PvEmMZlQK13BQtRD83imcc
	 ci7zK7rNF5cGVuRfmFJSi1uQ4bWpkQC3Oh3Cgsw2h4XMAIxkhnHx6FPELROqCZ94QZkKm
	 veqNjCV7JVxWPEK42PsViw6glsEyAq4tlKLAk14so5vljHiI34/90pmBC2BySOsGOkj4b
	 zF4eGwNI9sxObGgmMeWCBr7eMxSCd2oRPTbuE01PWBtQVYXskgXaNBbdkYYeVWB0ADvze
	 KyDg4le4wLOAfxIUnF52YESxnYG2kdIc+09AHuIEm67Z81pXXbzT/uwuAu40oQzqrSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="XCJce/J8";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kxub1Oep;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BC606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 403BC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCJce/J8;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kxub1Oep
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793656871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
	b=XCJce/J8MfvQe1drgcsd2FNO3Plw2to8qbFbG/gySocUd25jeFKBSJnUFE7Hiis0QaHMbf
	08jaABnbZPUdNHqsvbbJofFqF9/+TRe3ApfAV7tb6ZHLfm7Y/1dEj0WBbX71oxjIG38vpS
	SfL77eu/CoCRk9WXewP4Um26wurGaEA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-vewGM3CtMjKaht03zGimIQ-1; Mon, 02 Nov 2026 17:01:07 -0500
X-MC-Unique: vewGM3CtMjKaht03zGimIQ-1
X-Mimecast-MFC-AGG-ID: vewGM3CtMjKaht03zGimIQ_1793656865
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dff112136so2282990f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793656865; x=1794261665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
        b=kxub1OepQwqzw4DlS3rfA1OfAXqLMScfhFOmzNrJ1pTHliNk1VVITv2fVQ/UPxKoLU
         QfvGseif6c5bt0WFIJ0q12sb2pzR4u2J4YfJgBY7U8Om8in4RhWC7yMK34FmrE+4GSz+
         5gXSOvnknqCcZQQIYxRFUSH+fmdwg/m1R0R8VfsuasglNTZRYb1vc9L4ZSq03EUkFDpQ
         EDxoO11i0GUZyyb3Z5IUsmyft32Qt8D4a3HtGkVBQt9F6v0zVqPJqQvaXlauDKBuBqnI
         GfhxNDuwUIHctovuzeuFDmtxLnWhbV/XbrnwbJ+DDZqa2/otPHbkMbnwSEawQFS4m4PK
         1XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656865; x=1794261665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
        b=xas2J3PLbVX3rGQ+INK2ezaxd/23cyQ9LEWDBIhsDa337XHlXAa6JYhGtKBDWoy8I3
         wOV9dFfw3zYRHkvBmFca4btmlxrBTMsuA5ETngjkHKkp0/X21Th9l77W/R2PBqqEJRPW
         YcJ/3wdNnF+nV+kydkKz1129hnCr/u7n2aDVelGgDXvWPmOdf3BG47wZFpd7Uw1LbpbO
         dR7kkHFaiHP19rGCBJH8YqO6MZ6VvhZBx+FY6S8XUvaS3zdmXVSEg1j/857e2+lVKJPT
         jDtmEHOA4AouYIfVp3hlMQvzTyBrujswACw15ltp4wQTrY61qSrOIcVHgogMwX+Zp5sa
         fqrw==
X-Forwarded-Encrypted: i=1; AKwUvBzWkgohmmxXFLgLE78zBUX/uPqXQJ/aLGg7HjgI5VRy/ABj463wEaHO1fiqJcDheTax5oDbDRMqH/HkNFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z84oVr8ivHMijo9JExRdURrvAhzfoCFcREkVEDdGHof90xfQsls
	QiIalO9/bBDW2RxvO79T8lkjU2SmCE1MOzCakHogEKs2exI23LNsXa3n5OFciGfD8Wh3bSg6xYQ
	pF1QUCMvtEXg/b4NTMyCFqaJ+qK2sjfvjOUlUnj4SmO99YESLhVBypvyth4Yuo39Vvw==
X-Gm-Gg: AYBFou1K7Gg3FDsWP9vAxG3bNrwT8ACeAbo6ps9ixyBRBhzZqRaoDHMdHl8UssSXsGG
	ntTqA2ulEZfT8M9pFCxP38sgXO0CMlBWReinPHM5vmGiR+Yc+FQi1kLjA18B66e2krOTaI6rL8u
	T01XfcyCPsyPHghPusPKu20BSINboBHkWVgv3jjVfR6vqAVv2nCuGQXyCBJJMpm722JwRpCPWuN
	+nwsWr+idS3KGCJ/25Qy/cvmQXdec+1VwhsLsZhCEdI2oBlMf1H0fTletZmUIVimerqco5mToQr
	dEbjddZn3xCVhUzNfREBy9rcU4JVbR8qEp4g/OVCheImmr+tdi6g+0+B+gK2ISpV3R7SLP0wmrO
	VO2VlTbXyLlKrsIvnLbLkIhSwLBRYyWPlvBjQ5SS2Q5KwR+Fk4zDR4Fd6dtKMo2LvoY/goLCBjy
	pi+gqG1OkFhjgU1rmDNv6XWks9BBwDaPzZ25g7kw5995w=
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-48e6e2eb83emr27445793f8f.16.1793656864973;
        Mon, 02 Nov 2026 14:01:04 -0800 (PST)
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-48e6e2eb83emr27445750f8f.16.1793656864628;
        Mon, 02 Nov 2026 14:01:04 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm20953601f8f.56.2026.11.02.14.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:01:03 -0800 (PST)
Message-ID: <f4f0fbd6-63e4-42d3-87bf-9f888a8de1a8@redhat.com>
Date: Mon, 2 Nov 2026 23:01:00 +0100
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
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Mina Almasry <almasrymina@google.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sdf@fomichev.me, kaiyuanz@google.com, kuba@kernel.org,
 bobbyeshleman@meta.com, asml.silence@gmail.com, dw@davidwei.uk,
 ap420073@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 horms@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, phasta@kernel.org, andrew+netdev@lunn.ch,
 sdf.kernel@gmail.com, hawk@kernel.org, ilias.apalodimas@linaro.org,
 daniel@iogearbox.net, razor@blackwall.org, tariqt@nvidia.com,
 kaifengw@google.com, dtatulea@nvidia.com
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org>
 <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
 <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
 <20261102185856.1824792-1-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102185856.1824792-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 19:58, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 7:29 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 11/2/26 00:16, Mina Almasry wrote:
>>> On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
>>>>
>>>> - [High] The dma_dev use-after-free this patch says it fixes can still
>>>>     happen for RX bindings made on a virtual device that leases queues,...
>>>>
>>>
>>> I know about the issues with leased devices. That needs a bit of a
>>> rework, which I have done locally, and would like to send out as a
>>> follow up fix.
>> Will such follow-up rework the code touched by  current patch/series?
>> how much? I'm under the impression that at least the fix for the issue
>> reported here would be quite overlapping.
>>
>> /P
> 
> I pushed the follow-up branch on top of v5 here so you can see the exact diff:
> https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bind-map-dev
> (commits: https://github.com/mina/linux/commits/devmem-lease-bind-map-dev)
> 
> There is some overlap (~55 lines of v5 touched across a 6-patch +262/-99
> follow-up): it renames binding->dev/vdev to binding->map_dev/bind_dev, passes
> the net_device explicitly to net_devmem_lock_dev(), factors out
> net_devmem_close_rxqs(), and replaces the !rxq->lease / !netif_is_queue_leasee()
> skips in net_devmem_dev_unregister() and mp_dmabuf_devmem_uninstall().
> 
> I kept it separate only to keep this net fix smaller and easier to review,
> since the lease issue is pre-existing. Happy to either land v5 first and send
> those 6 patches right after, or fold them into a v6 if you prefer avoiding the
> churn.
I hoped for something smaller :)

I definitely would not fold the 2 series.

I'm wondering if this could be considered net-next material? pointing to
net-next will offer better guarantees for all the work to land in the same
release (no need to repost in such a case, I can apply this one to net-next
directly).

/P

