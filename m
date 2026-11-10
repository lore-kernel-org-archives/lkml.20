Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313460;
	b=0RLP96QPwJOHtRUrN/X5e6G2pr7PySsOGNXFsvTiRGMohQqMIwQtfnhsbaPU4YxZcV/k
	 LOFiP60g0W+gJH65vKhSorwLANJl6lpOkrxfq8rShzdr+6/fJU0N9QkhWlC5QBtFPg9u4
	 jaJQHP1ilufJ+eGkEuTP7vQOdBTibNAJ7xGH32KULNdm+QnVCJ/LaqmojP6Vq5nb2UTfQ
	 +pMXMi/9+M3p9qclCfaxX/8MDDkmFqlIYamxCh7sb91IrLend09Xn9HNPPYbA6AyeM4/2
	 LhtsH/xtmB0E0f61rtRgt6WxWJOl/sv8GM3TG1hmNRe1jXvvGJqyW3BvC/jbSMI9d9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313460;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=wFsoXKUNoLIzCNi3+20fsHsU6snYYd20/d5yBhH4GW8=;
	b=xGeqPIYcbx//1rA04HlzgoKkYZYzZ5ESBaXh0YCiap7ZfzdnBMe98ye/UCWe7PRTCM28
	 BjLH9/vAMFr72LwKUYY5KHrUX9drxZJQkLVnn7ZNObqnlNPWcN1CfWErhE7Ha4UkYbPWV
	 VBXg32Bh2PbrlFAeCNt7E5Gh+mu+dK8G6Htk+DZyfYVUOAmjuRo7mrIxTL/jvJIp+63fu
	 xu9gg+5IsphFJtsD9HhkWtmStP+rcZU5hYNJMlDDmVVa5k18bqpAetVtOBWRqSWKoETH1
	 RyP2qXEpipxg7IW8FS1kEeugz0OcdkPm8Jm4RWJFWejKWia+8Ea+ppkbJaI9FH6XEFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Sar0iEFI;
	arc=none smtp.remote-ip=95.215.58.185
Received: from mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9821C60A2607
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9821C60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Sar0iEFI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wFsoXKUNoLIzCNi3+20fsHsU6snYYd20/d5yBhH4GW8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794313456; v=1; x=1794918256;
 b=Sar0iEFIZqsHzAtdjYGPNuyCRqFvqIn2it3z7bH+l9BjOjkW5+PCyUCWdOQ6csq00St53S39
 Kc1xwHCdzpVEL83DXwulcKTOtjTq/EMG7s7QXSsKXZFKPUa7s4xdY5oaymQ/l27MYTYsx9Je8vo
 QQJojvuvq7NDVna7e94mTiSg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8278f7709b2dd07a;
	Tue, 10 Nov 2026 12:24:16 +0000
X-Mizu-Trace-ID: 8278f7709b2dd07a
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 20:24:04 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: n3rd <18670333770@163.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"david@kernel.org" <david@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	samarth.colleges@gmail.com,
	"security@kernel.org" <security@kernel.org>
Subject: Re: [SECURITY] mm/ksm: replace_page() drops the uffd-wp/rwp PTE bit
Message-ID: <avMM5DqYIGo9z1u1@dgvxl46587.localhost.localdomain>
References: <276f8d85.bbe71.1a1c549b771.Coremail.18670333770@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <276f8d85.bbe71.1a1c549b771.Coremail.18670333770@163.com>

On Tue, Nov 10, 2026 at 07:48:25PM +0800, n3rd wrote:
> Hello,
>=20
>=20
> I am reporting a security bug in the Linux kernel.

Repeat report: https://lore.kernel.org/all/20261020110758.960048-1-shawnq1@=
163.com/


We're wating for the final fix v3: https://lore.kernel.org/all/CAAbz3fTjWnZ=
mHaWT+zsycEvnEM-ZYXH0jG_XoV+yidYUquutVg@mail.gmail.com/

>=20
>=20
> 1. Affected kernel versions
> Linux v7.3-rc7 (mainline, built and tested as 7.3.0-rc7) is affected and =
was reproduced on two fresh boots. The same statement is byte-identical in =
the mm/ksm.c of v7.2.9 and v7.3-rc6 according to the static comparison reco=
rds of the workspace that produced this report, so both are affected as wel=
l; earlier releases were not compared one by one. There is no upstream fix =
as of v7.3-rc7 and no CVE has been assigned. Note that CONFIG_KSM is not pa=
rt of x86_64_defconfig, so the test kernel was built with CONFIG_KSM=3Dy ad=
ded explicitly by the preset in the reproducer bundle.
>=20
>=20
> 2. Problem description
> replace_page() in mm/ksm.c rebuilds the target PTE from scratch when KSM =
merges a page: newpte =3D mk_pte(kpage, vma->vm_page_prot), followed by set=
_pte_at(). mk_pte() only consults vma->vm_page_prot, which for a private an=
onymous VMA is PAGE_COPY, so the uffd enforcement state of the PTE being re=
placed is lost. For MODE_WP the _PAGE_UFFD_WP bit set by pte_mkuffd() disap=
pears, and for MODE_RWP both the protnone state and the uffd bit disappear.=
 mm/ksm.c contains no reference to uffd at all, and none of the guards excl=
ude a uffd armed VMA: ksm_compatible() only rejects VM_SHARED, VM_MAYSHARE,=
 VM_HUGETLB, VM_DROPPABLE, DAX and VMA_SPECIAL_FLAGS, and that mask is only=
 VMA_IO, VMA_DONTEXPAND, VMA_PFNMAP and VMA_MIXEDMAP, with no uffd flag in =
it; the reverse check vma_can_userfault() does not reject VM_MERGEABLE eith=
er; the KSM scanner only skips !pte_present(), and on x86 pte_present() ret=
urns true for _PAGE_PROTNONE, so uffd-rwp armed pages are scanned like any =
other; and write_protect_page() only calls pte_mkclean() and pte_wrprotect(=
), so the stable tree anchor twin keeps its armed PTE. The observable effec=
t is a selective, silent disarm. The page that went through replace_page() =
takes a normal copy-on-write fault on write in the WP case and reads straig=
ht through in the RWP case, in both cases with zero uffd events, while the =
anchor twin in the very same VMA and the very same uffd context still deliv=
ers UFFD_EVENT_PAGEFAULT. A monitor therefore cannot distinguish no access =
=66rom enforcement having been removed, and there is no global failure sign=
al. The practical impact is that QEMU live migration dirty page tracking si=
lently loses writes on the disarmed pages, so the migrated guest can end up=
 inconsistent; incremental checkpointing and in-process write watchdogs hav=
e the same problem. This is a policy and enforcement bypass only: there is =
no memory corruption, no out-of-bounds access, no use-after-free and no pri=
vilege escalation primitive, and KASAN stayed silent across both rounds. Ev=
ery other path in the same kernel that rewrites a PTE does preserve the bit=
, for example the fork PTE-copy helper in mm/memory.c, the fault paths, mig=
ration in mm/migrate.c, swapin in mm/swapfile.c, hugetlb, mremap and UFFDIO=
_MOVE; mm/ksm.c is the outlier.
>=20
>=20
> 3. Reproducer
> A single statically linked C program, mm05, with its source next to it, r=
uns as root inside a QEMU guest. It maps two three page anonymous VMAs: wp_=
area is registered with UFFDIO_REGISTER_MODE_WP and armed with UFFDIO_WRITE=
PROTECT, rwp_area is registered with MODE_RWP and armed with UFFDIO_RWPROTE=
CT. Pages 0 and 1 of each VMA hold identical content so ksmd can merge them=
, and page 2 holds unique content and serves as an in-VMA enforcement contr=
ol. The control page is written and read first: the write is blocked with a=
 PAGEFAULT carrying flags 0x3 and the read faults with flags 0x8, printed a=
s JUDGE BASELINE with the verdict ARMED. MADV_MERGEABLE is then called on b=
oth armed VMAs and returns 0, ksmd is enabled, and pagemap bit 57 (PM_UFFD_=
WP) is read for all four merge pages, all 1. ksmd merges within one second:=
 pages_shared goes from 0 to 2 and pages_sharing is 2. After the merge exac=
tly one page of each pair has bit 57 cleared while the other keeps it, and =
the roles are derived from that bit rather than assumed. Writing the cleare=
d WP page and reading the cleared RWP page both complete instantly with zer=
o uffd events, while the same operations on the retained anchor page in the=
 same VMA still deliver events; the program prints JUDGE KSM-WP with BUG-C =
CONFIRMED and JUDGE KSM-RWP with BUG-D CONFIRMED. Because replace_page() is=
 inlined into try_to_merge_one_page() there is no replace_page symbol in Sy=
stem.map and a kprobe on it is rejected with Invalid argument, so kprobes a=
re placed on try_to_merge_one_page and write_protect_page instead; they fir=
e four times each during the round and the trace lines show the ksmd thread=
 executing that merge path. The complete reproducer and the raw console log=
s are available on request; I am not posting them publicly.
>=20
>=20
> 4. Conditions
> The target VMA must already be registered and armed with UFFDIO_REGISTER_=
MODE_WP plus UFFDIO_WRITEPROTECT, or with UFFDIO_REGISTER_MODE_RWP plus UFF=
DIO_RWPROTECT. ksmd must be running on the host, which is a deployment deci=
sion the attacker cannot make alone. A page with identical content must exi=
st to pair with, which guest RAM zero pages and template pages provide natu=
rally. Triggering needs only MADV_MERGEABLE plus one ksmd scan period, so t=
he sequence is deterministic and has no race window, and it does not depend=
 on THP, SLUB layout or kernel randomisation. No capability is required on =
the attacker side: madvise(2) only acts on the caller's own mm, and althoug=
h userfaultfd(2) needs root or CAP_SYS_PTRACE unless vm.unprivileged_userfa=
ultfd is 1, the monitor in this threat model is the uffd holder itself, so =
the attacker never needs uffd access. The attacker is the monitored process=
 itself and the victim is the uffd manager. Tested on x86_64 with QEMU 6.2.=
0 in TCG mode, two vCPUs, 4096 MB of RAM and an initramfs, with CONFIG_KSM,=
 CONFIG_USERFAULTFD, CONFIG_USERFAULTFD_RWP and CONFIG_PTE_MARKER_UFFD_WP e=
nabled and KASAN on as a control.
>=20
>=20
> 5. Suspected location
> mm/ksm.c: replace_page(), specifically the newpte =3D mk_pte(kpage, vma->=
vm_page_prot) assignment and the following set_pte_at(). Supporting gaps: k=
sm_compatible() does not reject a uffd armed VMA, the scanner ksm_next_page=
_pmd_entry() only filters !pte_present(), get_mergeable_page() uses folio_w=
alk with the same pte_present() gate, and write_protect_page() only mkclean=
/wrprotects so the anchor keeps the bit. The reverse gate is vma_can_userfa=
ult() in mm/userfaultfd.c, which does not reject VM_MERGEABLE. Paths that d=
o preserve the bit and can serve as templates: the fork PTE-copy helper in =
mm/memory.c, the fault paths in the same file, mm/migrate.c, mm/swapfile.c,=
 mm/hugetlb.c, mm/mremap.c and UFFDIO_MOVE in mm/userfaultfd.c.
>=20
>=20
> 6. Suggested fix
> In replace_page(), after newpte is built, mirror the other PTE rewriting =
paths: if the VMA is VM_UFFD_WP and the source PTE carries the uffd bit, ap=
ply pte_mkuffd() to newpte; if the VMA is VM_UFFD_RWP and the source PTE ca=
rries the uffd bit, restore PAGE_NONE and apply pte_mkuffd() as well. Templ=
ates to copy are the fork PTE-copy helper in mm/memory.c, the migration pat=
h in mm/migrate.c, the swapin path in mm/swapfile.c and the hugetlb path in=
 mm/hugetlb.c. A more conservative alternative is to make ksm_compatible() =
refuse a VMA that userfaultfd has registered or armed, at the cost of losin=
g deduplication for those VMAs.
>=20
>=20
> 7. Mitigation
> Monitors should not rely on events alone: re-arm the range with UFFDIO_WR=
ITEPROTECT or UFFDIO_RWPROTECT periodically and cross-check pagemap bit 57 =
(PM_UFFD_WP), re-arming and warning when an armed page loses the bit withou=
t the monitor clearing it. For QEMU and KVM, memory merging can be turned o=
ff (-machine memory-merge=3Doff, or host /sys/kernel/mm/ksm/run set to 0) a=
t the cost of losing memory overcommit. Applications should avoid MADV_MERG=
EABLE on a range registered with userfaultfd, or keep deduplication on sepa=
rate, unregistered ranges.
>=20
>=20
> 8. Disclosure
> Public. This report is sent to the public linux-mm list and LKML and no e=
mbargo is requested. The reproducer is not posted publicly; it is available=
 on request.
>=20
>=20
> 9. AI-assistance note
> This report was prepared with the help of an AI coding assistant, which w=
as used for the source review, for building and running the test kernel, an=
d for drafting this text. Per the kernel security process I treat the issue=
 as public and I am not posting the reproducer publicly.
>=20
