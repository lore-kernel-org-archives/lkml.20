Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119657;
	b=2w03Bct6+5Qys0Lr2L2s4gEEkzTARBSCDMLgP5S4wzW71OfdcIePYqM81l9iAXO9mqWv
	 VUPAzG3CDPXjudnvrcrWquEjhk4Y652H9OikUkDILUrOjZzfJJSFjOeq8R7l72uFEsIu1
	 J75YIwTi5haqcbLQFhigZopE7K+LkCp+IO1XxTXGNnSZqyWmtrb7q20p1OWcbo2JuSP6u
	 m9NAN/b4ZlpI6ra2JLfZCTkOh9Kdb6JzMaJalU7YczQJSoY2GeCNLFIVwElSqeMSKR11X
	 UBNE5RH9+i61sKoSirxE1eLTbJlw2S1Cy/lUiUevr15p1T/9LsppPJNTNcwD10XtGsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7RlopbpHsfSD/OHRLgQiY6wQ2MChlTJY7NnjiKCoORg=;
	b=2HBUvC9J1rSBUCGAfxD9OmGFztQGMlcdxC1Yq7QF9Exfx4Q1hMCu0xzpzTJ3M1nZGSoZ
	 hHmCdhGdXYJMc0XjleiE7aC0oJ2j6l/Mx++dsr6tpqZytwuRG7OPwocYM7JboQTWXVeJt
	 qP0gAZ0JlEji5IbBo7Ctrmx2fX15YqfdtokUKsnjh6z6bkA3pUdv7KwNcjuPgOATV7uKm
	 OjmkLyxl8zTNUd7CF8+Snj1vkY6TMJZ8IEhfsQtbUdR7hk798DVO5wvkvP/bEkQ4NlB8p
	 liLBv2mFl9xJtuCVGFOS+FZtDwU74t1eq884O7Jrbiroefo0mv2uR9zREtpcO849Ztg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=g2kji7Jk;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5It0pUNP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF873606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF873606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=g2kji7Jk;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5It0pUNP
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RGXbMJ105241
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=7Rlo
	pbpHsfSD/OHRLgQiY6wQ2MChlTJY7NnjiKCoORg=; b=g2kji7Jk4RhgPJwv9HHA
	naNWY22THk4WwGe/onm8xh1Uf6dP1LvHroRUCU9ynd3jMTEYToa/hG0mRCRIjw9j
	hnPUmvdzWwYwJg3sN7pi5HbbsaZiHumQQ9a8dEal5SxjjUiHlqBEPyf/6fG8j3bE
	c+cy9kt2nG2sLEKbRjW7w97kJOnyT7NIqdEWcsarsYIq34oMN0uLAlSLyyt8SHer
	oyMuJjnx5p5gns/Wk2/Q36cpP1YQntoEPCF9GNxcDnzIOS+QtzRE2yvZ15wpsVMa
	qBgjNPh1CPUgHKr7LVVAlF/S/MGglB+Gbh0m83oOS6xF8vihaD8JdjCAxMhT8dTf
	CA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hjqr9bs17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:47:28 -0400 (EDT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60a365440so84771a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119648; cv=none;
        d=google.com; s=arc-20260327;
        b=sfzMNxVU1Kah1P2FSV3r9yJmAnM18nTVmaZzBYMIZqZI8EecDvsJPyLRD5cQI2xx4y
         XNmwM+nk9oZAAs+um69kDK0qi8x+DXWqsxIgKC3U5/dQh64CELC6ZVXB3Qs/TjV1WD3P
         X1CdH+/hfMbi/PrEphAHk35eqImAOSvBUhscmUebmRsfysSvSRxW1XluBy4DCVPb0Dd9
         Og57qRWiTnZKhXiLSRvaQzCaleb+ewDDCS9nxxZhngXOhbuVjf0gQ0smDXq3n6uBgUUg
         lDoiCjNonpSK6q7DDPxYC2SnAxQkTKSJeWiXm0angY3aHyKObxqNqi2firk0v4JCqafW
         9seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7RlopbpHsfSD/OHRLgQiY6wQ2MChlTJY7NnjiKCoORg=;
        fh=acN5hVh8w/DN1+t/U16LDqqGQ5Ihoke0BTqdYBRECTw=;
        b=koColoHMZS97hBtP3g3+5d7jvrXe0rU7P8B8htFhBK9Sn9KXD0zc+T2PDs+ksS2jmB
         E53maFmxxDX+NVFLQPD5MbzoECI6+8UniwcF/ErBB0R/g2sRLZAxImMEYju+y/F7B0I6
         x9krJ1zpFDQQU3saZJvPxyCIsi3tP5CZl6Q+mObn30uzukxQN9E2qcC8o29RNoTyD2sg
         CIe8bh8SGelUqcaMt/KCUnkWW3RwSzy5Wn8tbq1JSFeeem1U32Zrv6B7m0YFK3FJHIIa
         HkqnrsDIMx1s0Oi5X8Gx4/dmo8VjOsWOTGG6AGpy8VnvfqxBKZ44Zl3bkBmPLHde2m2f
         XIYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793119648; x=1793724448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7RlopbpHsfSD/OHRLgQiY6wQ2MChlTJY7NnjiKCoORg=;
        b=5It0pUNP6sAU0UJq7v+0TGbOJTxxfbRZZz6AU4F45uLNdu/KdMpHxt6YLS1opcxm8P
         SXZz9ov+xgP+/hGAK94LD5JonCI/aImrpjAvfZXWyVcjrHBjfP42yFEGIK4FSlle4fGF
         kFjepaycHDac8fwS1r7K5wVnodmrlk69D+uMqQD3XbM2b2P7mTypo4kC0hwNKO/W0ce5
         P+1+Df6V/BD7ZJ9VgepxsPmInmqpoCNL0fyp2/utKmtCITK8/cUHsIHZn6IFNlBJWbZX
         PKB5JwE3EqVmhZnoVatXq6ms1R2c140fXCFVm+XDQJ0PaoJGjItS5jAe1YfRRUyqg38r
         TIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119648; x=1793724448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RlopbpHsfSD/OHRLgQiY6wQ2MChlTJY7NnjiKCoORg=;
        b=FZEOVqoexpROzOH4MNFu9utwkOR8YI3Wn8CvRUbpjNYkaAvADEJ2duf5dvAMUJjJLJ
         tvsklXb5nbZuPUBvfGgXd/d9FthZlRbajEhkY0VLyuGXmUi3xP8dhsnK8UKir75IJfHm
         Zp6YNIxPqTF7iPiOKrW4xbZTThBEZNaj8RW+YvKkMm9b8bPc2ZqbFB39jJ0qB2biFyFy
         GBq6RXQfDmVMAGVVE2ilC/ZzA+moHDrb1UCjkv7jyJq/kjeS0rmfyqYxfap43g01hQFe
         EIt1RaIMtNZcreTDwKJoQiYdf+aCkVZofFDt/r3NskFrYO2z6Rn+xx1navcK/G2uTmfK
         26Og==
X-Forwarded-Encrypted: i=1; AKwUvBye9f7ar3OFfVrOEeYLaRYWk4CHS2Nwn0HuZ0jCPfO08ysSxOFLEQA3eON54PIaypdXwgKQRUDOHLzD/vA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIasS2ZsT/xYi/6x9Avgxd80NbCEinD6SLzL9FA+9PGD33FQD83
	a4n2bI5JhfNgzBVXgH5bi8eMlvS7d3zuSjcBX9AfwOyqUQRK3kz+AXlZa5QHyfufJmQBDmMSPeF
	Tn4pphvm48vQBOjJwVBYB3Ze4QD2zuA5SmZTRxpXcHcyM4Ya8M7K4Yuj34G0FoJ/TaUwEkL91F4
	r8S/UFaA1JcnRWAYwKw8LDchWLxWccGOUDMuG1
X-Gm-Gg: AYBFou2DreHPnb97456JIv5SHmm4SEGGpXexndhqNzvgOBdr9WQYzxyB4YWDu3pjrSo
	V9rfLwGezGcBODDjVYo5tJp/vDBy0HeOw/bPWI+NJjgFPTa3IRjzyairvoUM/OVCZ31alUp63EA
	0y74tSTdDvxObH19u3VIzJ9E/N0ZuCtZ7Kmq8mD/nJBUwD8RW9zdZWiO7GwQ/ZbiqK+cbznIXtg
	AKmifBoe9DNH7dEdRzqFnPwXg5OqzcGDK2DfolO4Nl1EtC36hlsHw+xIt0UeMxEeksViKayGQlQ
	ypAXdrkHUMhaZmd8Ik7MgqrG2Q2e8J5SaHWf+Y0Yc6RKTsZsXr7Q79ULePSb
X-Received: by 2002:a05:6a21:610e:b0:3e2:7c10:d47a with SMTP id adf61e73a8af0-3e7bfa41045mr7510161637.15.1793119647857;
        Tue, 27 Oct 2026 09:47:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:610e:b0:3e2:7c10:d47a with SMTP id
 adf61e73a8af0-3e7bfa41045mr7510137637.15.1793119647432; Tue, 27 Oct 2026
 09:47:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-thpsplit-careful-v1-1-d357d70fd6f4@columbia.edu> <9620707e-59f3-4b91-87af-2b8e12fed260@kernel.org>
In-Reply-To: <9620707e-59f3-4b91-87af-2b8e12fed260@kernel.org>
From: Mani Tofigh <mt4022@columbia.edu>
Date: Tue, 27 Oct 2026 12:47:15 -0400
X-Gm-Features: AclHuK8gWWzzlKcn_L6a5T3j9EArAQHuwSjlQ0HWOR8CGZpOIEuzbTcpRfvDslE
Message-ID: <CAE2e9Owov22KK3ZPkfqwrJFpAMc_H5Qq22aoKpQ=0mWhiX5Q_Q@mail.gmail.com>
Subject: Re: [PATCH] mm/huge_memory: fix deferred split list corruption on
 partial unmap
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
        Kairui Song <kasong@tencent.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: k3sdaUdrfbBepA2MCjHFOPsjsb4YEYOt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfX/n1FxY4aQCX2
 fxWyJVBkp2NKSJ/zDzYiU85+VnCSHXGrGTrcbtlNfdtOwQUiEdxpBDxWNSmYc6oMuGbSXJ+SfNU
 a8cw1rHzKUpPYNtFZOuduKSIWhzak9ctF/2OEhVStwvzZlS4dWJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfX+HUinDUNY6Bm
 WraC6k6hAkpqhAizGW0n8+GKzu2ouvLW/QltmrgmKCcRwjD3/Zt2pjTYZaA4FbLRxhtG5NRHQbm
 Uf3GJR5zhRLGivjFUaUbnlbvWbN7pwMvITngD2wxei2xmu0jXkxUY44+nTQGskQhcCEDh/prWuo
 MfWNpNpVBs44g7Dm7Rr9wsK3N57Uhfe5r17VjbPpZd40zfbWMUHb5S7VfCRII7v/LhzBIuBtRbB
 00uSZaNQJ7WSxM2GlfPub7Jvo+fvKsPN/0ONUaESukRnhjOBPvHJZmNSQ7lkmNvtjh6LGQptGMh
 x2e3Dfq+9L0n5knSIyNfcmHSMsUFOvMVnXfac8ty+nUrkb+cNZU+Bsl+XU0YID5muwAM//ZN/pj
 idDDSQzrELcAelINvaqi/YkyP79usRFFcjlfd1ntfjCn96EmksYuz0PQh6sPtTT33JNyutDWRV4
 rz5it5fCPcoctRTNrIg==
X-Authority-Analysis: v=2.4 cv=PKSaavqC c=1 sm=1 tr=0 ts=6ae0d5a0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22 a=VwQbUJbxAAAA:8
 a=nzbCeCAtSJT6Iwx4FrAA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: k3sdaUdrfbBepA2MCjHFOPsjsb4YEYOt
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11948
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=10 adultscore=0
 bulkscore=10 impostorscore=10 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270065

Ouch, sorry about that, it was not intentional. I searched for similar repo=
rts a
couple of hours before posting, but missed yours since it went out about an=
 hour
before mine. Your version is actually the better fix (more on that in your
thread), so please drop this one.

Thanks,
Mani


On Tue, Oct 27, 2026 at 5:01=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/27/26 01:=E2=80=8A22, Mani Tofigh via B4 Relay wrote: > From: Mani =
Tofigh <mt4022@=E2=80=8Acolumbia.=E2=80=8Aedu> > > When a THP is partially =
unmapped while the deferred split shrinker is > scanning it, the deferred s=
plit list can end up corrupted.
> ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
>
> ZjQcmQRYFpfptBannerEnd
>
> On 10/27/26 01:22, Mani Tofigh via B4 Relay wrote:
> > From: Mani Tofigh <mt4022@columbia.edu>
> >
> > When a THP is partially unmapped while the deferred split shrinker is
> > scanning it, the deferred split list can end up corrupted.  With
> > CONFIG_DEBUG_LIST, freeing the folio later reports:
> >
> >   [  523.871401] list_del corruption. prev->next should be ffd40000005e=
0090, but was ffd4000000500090. (prev=3Dffd40000005e0090)
> >   [  523.871412] WARNING: lib/list_debug.c:62 at __list_del_entry_valid=
_or_report+0x177/0x220, CPU#0: thpsplit/63
> >   ...
> >   [  523.900715] Call Trace:
> >   [  523.901753]  __list_lru_del+0x5f/0x220
> >   [  523.902588]  __folio_unqueue_deferred_split+0x238/0x520
> >   ...
> >
> > Without CONFIG_DEBUG_LIST, the list is left pointing at the folio
> > after it has been freed.
> >
> > Since commit fafaeceb89a5 ("mm: switch deferred split shrinker to
> > list_lru"), deferred_split_scan() moves the folios it scans onto a
> > private list under the list_lru lock, drops the lock, and then removes
> > each folio from that list with list_del_init(), which sets
> > entry->next =3D entry and then entry->prev =3D entry.  Another task may
> > in the meantime partially unmap the same folio and call
> > deferred_split_folio(), which queues it only if list_empty() reports
> > it as not queued, and list_empty() reads only entry->next.  If that
> > happens between the two stores, the folio is queued again, and the
> > store to entry->prev that follows breaks the new link:
> >
> >   Task A (shrinker)                     Task B (partial unmap)
> >   -----------------                     ----------------------
> >   list_del_init(entry)
> >     entry->next =3D entry
> >                                         deferred_split_folio()
> >                                           list_empty(entry) is true
> >                                           list_add_tail(entry)
> >     entry->prev =3D entry
> >     /* overwrites the prev link that
> >        list_add_tail() just set */
> >
> > Use list_del_init_careful() instead.  It sets entry->prev first and
> > then entry->next with smp_store_release(), so once list_empty() sees
> > the entry as empty, the shrinker has finished writing to it.
> >
> > The reproducer repeatedly faults in THPs and partially unmaps them
> > while the deferred split shrinker, run through
> > /proc/sys/vm/drop_caches on the same CPU, is scanning them.  This bug
> > was found and replayed using a deterministic hypervisor currently
> > under development, but the non-deterministic C reproducer can
> > typically trigger it in the 10-500s time range.  With the fix, nothing
> > is triggered after 1800 seconds.
> >
> > Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
>
>
> Are we now sending alterantive fixes for anything already posted? :)
>
> https://urldefense.com/v3/__https://lore.kernel.org/r/20261027-fixes_core=
-v1-10-6f74bec9a5bb@kernel.org__;!!BDUfV1Et5lrpZQ!UY3X4w_grTd5b7xfCu9wwNwdk=
STttnBXOqxvYQg-6iGDIzSIewW3zRtTjNpV60Vszy5yvmUPwTRGqM6HMis$
>
> If there is a better way to handle it reply to fixes already posted.
>
> --
> Cheers,
>
> David
