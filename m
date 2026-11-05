Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.165
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793869608;
	b=wHOK/dihW24MwITnDbv/VK3e1FnDNlGZEUIRwk2t4/PRZyFXlpiM39pKBPOVz+pPudeS
	 ioIS+eQ5euEVXgQ+os/8g46Vh0VRp2gCPB7db2RTBjY+SUB2stP9HkfxUig92v+MYINQ/
	 qJg2EffB94CL/rF+EqBkf/YdlnTvE8COf4qmYP4P+IsLDtFtky0SkbFUkvx1owMFtFkZz
	 pQ3Sf+5dKEo2Kp7DtJAFVFIOqUu4gzXf4G1MXLq2LoQWTTW1o0SBrvhv4inixLMHcXttp
	 AfFVoT9PhihefpFp64P+UOcg7D9x3KVtks105CZlktf9E0CMVOzMbjG/7iGQkQjaLUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869608;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Content-Transfer-Encoding:From:Mime-Version:
	 Subject:Date:Message-Id:References:Cc:In-Reply-To:To:X-Mailer;
	bh=vdDDMtXuZcI5ST0g2B/YWhJgrol3S1EgLV5st/yxsdo=;
	b=YLZ7fVB6ZBGcQOioLtbrs/PNYnJS+9Z+yzpFZ6KuBPzA2hJlPIcw1qpJ/1IWnXuSczj5
	 zhdnqea1DA9vTH6SslOwSb4fEUhRdeoQsfkRdDRBUpJnuhfqD82HAYKWxlyj4szuRmq0T
	 Q5dysTnsJjvPZ/MSG928W8vGDqWLoHTJfJjEa6ec203bUsi2jHQDG5lb/+PYrq+KSXaoM
	 GCNg1SgGb/TzkFlixQIBB1zQ+hkIh2o26rH375wVcbLgSB0i5hQpXBY73xkjecXkKYpxU
	 jU5vLYOUhPlf3qEbKwB3/R7oeYSynPoGEVb/LVy18sTSE5VucS44EfkzDLzuHZBkHdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Dqhs6ux4;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="en/3zAni";
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.165
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CF9606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7CF9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Dqhs6ux4;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=en/3zAni
ARC-Seal: i=1; a=rsa-sha256; t=1793869599; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KzuDdj62wMjg3lpF2BnQUkUEg1EDpjdGd8wCX/Z54rePmQDGGO0yZpIP1mEFj2KWWR
    Y3WTNtgMGyRlWSYCB3ym67/wbNaHTDhHpSf5ZDf0xhVYZIwIVf6fOzuJPxtoClZcIA6C
    rwQI5cfJKGEDUE989pFYU/Il2q+q9E2gimbXI1HO6TN4KqDLXNCL+SJ9fu8SvhPK2lw8
    zF0hKhLdmNs0APN9byudg2Kb6dJGKhIUFmEPMliU3jDkcRwZO3ntn2eQdMyz8926C/Ol
    PWr/c9s/RRn6QxNX75mA309WjN7j68cDfCQgq5VkvG4cHh0JUl3fY7dWJSqew2Mp808y
    Q7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793869599;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=vdDDMtXuZcI5ST0g2B/YWhJgrol3S1EgLV5st/yxsdo=;
    b=tSKmBlWUo5x386RVHJPhsFS9UxyLnzItZyh9oywUKjJqVTO7sTy30wWsk+qmVsMIZi
    T6rev5UshYXFzE8VLV/KWajr8p0WA8gTTdrjljr2/2rd6/RFn1k5GrXaBG5Lx2kiE5Ej
    5LRcbiGW6GV6ODSBpzs70nxivHbGOsUFXiilerdRzNVCLJaHfZ+0daghLDcjqdtLqTCm
    jglaqb95TBRGP7seEHmMH9WsFRtXOPL22ISAFz8c7zAJSCzkwywC0y9KoGsoeHhf9L9r
    2fXc46pZa85BQnt3CdZHx6YwOc4ULZiXcJphUYQw1VtSeLPkAXg2W8XcQCJxnNSuLzse
    RI/Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793869599;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=vdDDMtXuZcI5ST0g2B/YWhJgrol3S1EgLV5st/yxsdo=;
    b=Dqhs6ux4Wg/WrHZDCrySI24vmjzQgGyBWTIQhn2UX9rWk8VPTb5UnUXBskjxUv6cuL
    EkYBes3e+IhHOCJPYKstOHiB9F1aIGE4D+iBD8xKmnPxmCX/XPLZ7HOvL57SwSDLnIyB
    7QOcpwIJOqvxZwrZ5oBsqvLHj4EiWiJ98tN7cDu5Y8ixt0wopRNKGh9NFTUy6sQBEFkC
    aajNkfapDKXEft9rKz/YXnQNPO/GYXUGuNgbgKBLn33T8SF1nUXONdG1qDIR4qp9PYY8
    mLuaKFxqa/6kzLrHefYR5KbnKV6DrOpW5a0Xu9Koz/mrCsB41c3zOsrSpR1rRSPxaFoB
    GvmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793869599;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=vdDDMtXuZcI5ST0g2B/YWhJgrol3S1EgLV5st/yxsdo=;
    b=en/3zAniDl/LRIYdJeFvnBVq9POSUfDTctQmwnz3zQuR6FUVZFgGH6l0EwGAS1Nuj8
    VxlbZITG9NIuwm3RdpCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5i1s3mVDnvabcnE8Xz5iRUIWLwPs9mBpLTTaXc="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id e825d92A596cO07
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 5 Nov 2026 10:06:38 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/2] KVM: PPC: BookE: Disable preemption before loading guest FP and Altivec
Date: Thu, 5 Nov 2026 10:06:27 +0100
Message-Id: <4FED0F6E-890F-4482-99F3-39D7520C48FE@xenosoft.de>
References: <c485c31c-1330-4be2-bb95-447cefa82c1e@linux.ibm.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de,
 harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com,
 venkat88@linux.ibm.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>,
 Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <c485c31c-1330-4be2-bb95-447cefa82c1e@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
X-Mailer: iPhone Mail (24B119)

On 02 November 2026 at 2:07 pm, Shrikanth Hegde <sshegde@linux.ibm.com> wrot=
e:

=EF=BB=BFHi.

On 11/1/26 1:58 PM, Christian Zigotzky wrote:

Yes, I can help with testing.

- - -

Thanks Christian.


- - -

Hi all,

Ever since we enabled PREEMPT on our Nemo boards [1], we have been experienc=
ing occasional problems with the kernel stack.

Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: s=
rcu_gp_start_if_needed+0x534/0x538
Rebooting in 180 seconds..

We are using the following patches: [2] [3]

We have disabled PREEMPT with a patch [4] again, and since then our Nemo boa=
rds have been running perfectly once more.

As the problem with the kernel stack only occurs sporadically, bisection is i=
mpossible.

I hope you can fix the kernel stack issue.

Thanks,
Christian

[1] https://en.wikipedia.org/wiki/AmigaOne_X1000

[2] https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/pat=
ches/X1000/preempt_v1.patch

[3] https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/pat=
ches/X1000/kvm_powerpc.patch

[4] https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/pat=
ches/X1000/Kconfig.preempt.patch

[5] Kernel config: https://raw.githubusercontent.com/chzigotzky/kernels/31c0=
64092e3aab0875c47d44838443c9515b2970/configs/x1000_defconfig




