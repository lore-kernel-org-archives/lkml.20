Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794331462;
	b=uK7q42YwsSn4lqxNZQzvuCh/f8EUFwCiCZY8a1m75jjT9VhFAbDK9dTfTNoh3hGylaRx
	 HL3Gu2J1AGWB+/PPRrK23jogEXHoWWj4ZLCHX1Em1xZZK2sd5Ckxb5AgjFLqW6aFwySGa
	 56swdwld3IV9B3/kTWtp466PA4lDZikZsZ9W/5vFpO5Os/Lfn3Rmv3jd+p1RIsp62F+rH
	 UqCSNMAY7jRVIMA9h0MPYSKhnFk2qhKBppAxJyUnfFc2afECx604N7/owYsV0j9MhO2Hq
	 zLHavkC3A5T1LKaQRZfRD8ZEWBfGA6auABG2taPwa1TYYPNfswR5S+lIwP4NNPDoNKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=WYfjoEFMi/uko9tLJAHgU2HduOmy4kLZOnQNrOVFSL0=;
	b=MpjBdFiOLmwuJdlLdFGUoX44JVyUBCTiecGu6FZrt0yVzFLuc2ITdX2igN5VsBzAcWBz
	 H2CS/eK61b8ysM02Vrd4jBIUNobTMVKGe8XTz8Z8UXZJ80C7yE7pRWNyZ7MtDk0lpsQV4
	 UNHaHvKtpPcskd/PIRfaiqcUkV0AKbvk3rX0Gvis65NCR36Pwl0pSgWBo4+LVJ3RSTbL/
	 6+jU6duPBqOOnm7R73sSlHIceXHJ97LTAKjKobfFtQfFz9tVhcLPVWJTiP2RQYQBH34xz
	 mW5sBPl5la0cs52jZpZhGItglP1VFfG2Sdu2/JVxkPeGtBBbEmwMFDV4J6+GDzJMx+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q2E1nWty;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A77606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A77606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q2E1nWty
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679aeeddc6bso2898452d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794331461; cv=none;
        d=google.com; s=arc-20260327;
        b=kElnh10L2/sIRz2apjClQ5zKlGCvouaNiaW/mB2BP0XGW9+X2sNPzcFC2WpdPa0AD9
         gvZPUvpHcj7PaYgXgYs8TQ62cV1REw9M4TS0XKnGH6fA7ZEOjnQMUUJLcJI3w/rUVv7D
         RjYST1WGPnEuhcIHAhs2rlawH7MX55QutYR4leb8NHNyJf2Fmf/wuCQQJXNEeJBcJDA+
         oCpfHKPugqSpO96lpnXY6FYvabdKle/K7ESCiTStA2ZHdZOWm/gfCjjjTlQy4SD88FM/
         7AY3bquOvpn3fVRU4jPnHhaBr5bE9hRPISYgRKKVvTmM6PxwNEApGnGpMVOdGBhITkHc
         ts6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WYfjoEFMi/uko9tLJAHgU2HduOmy4kLZOnQNrOVFSL0=;
        fh=KIjTxnepLK7K2rz7Gsst6PUhHfkUHCk45UYHooJrcK8=;
        b=YYOHUugX63l2yCsYqo9UtG0HSSLjqASKbzkD8P9q4sKbeo88ciygC4mkci5CLSGD7X
         tln2GDg4Hfeq4tQmFxkbD+141168ItS1Wogoe7hcTZhq3wDUgd1yZsT+NRTIv9mzvgdG
         bsQaXq+T2e1iN7BRcrhw+bvHKchasDyhf9YhTbjQFPaR0StaZ0l68xKCoAXECW0HM3Oh
         1zxVfC3l2zQdjHhWcsYkvarJhdcREitL+OByAKXPOTwpo5BPgE2KGiwqBQkg152fMJ6h
         TbI7WI4VmT88Dkkreawab/9yGeMWHOt7eUh9CZDfDpUrjzfBkdvxZKf3fuiFFpc1S6cF
         EW/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331461; x=1794936261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WYfjoEFMi/uko9tLJAHgU2HduOmy4kLZOnQNrOVFSL0=;
        b=q2E1nWtyBu0iD0lhM/6S19OnmsbNA9YSuFLupDRBRtIPl92EMNmcuaKJriPgiGhewV
         7XhGT+xP7bmgKItfxWyFSaoL1AG93SiycktnR51RpTHUA8KmQbSIZOmJdEVBGNKj3MRA
         SYFd4ztBtYJqZ9usCPaScIp03Q9DUcwuC3Zoj0ykuR/7vzu/AvyAw3R7OGTVTTHLlcHU
         XuBf4/opMBV570MIJiNj8g3XTDZ61bd3HeTWmoABaQHp3rXL8Rp9K3gl/OAgIAKot5D6
         qpRNSid+uyoFmyhgBwIUKlSiFRaIDkNyGb6QVSWW1LJjcmI0S3T5kD1+O2qHXoPQzaN6
         tn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331461; x=1794936261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYfjoEFMi/uko9tLJAHgU2HduOmy4kLZOnQNrOVFSL0=;
        b=q/ixKyKfTEEJ0nghLV6kSIFo5fd/BpYCXR9dQr8tZiMXEUR+cReMRDue39kc2VCW0I
         2uMDTtL8UfUXPgod634UgioDvxOEROIDLuCeqwfjFaOLbLjqUqCOl5TeVALZEuG5rt2H
         5H2V3zypMrXxeM+DmEAlp5LN0LLbuAYladEy9rdNkWUSETTNkiTxYatjEObVslOMnK7x
         EWDiKOBSmWEd000qAOJ1zIal1XU/c5IE4CCYdz3VKJXAq6zPD6SNlcVybNTJol5G0BFn
         I+JadtpWUWEUPGdUMVWxQC38ciwauEH5E73WRilBiSdkuuxAVePN4rEeUjV/ikILS8z+
         YboQ==
X-Gm-Message-State: APuU4Z8BpyiNF/fXdMgP1NLfYkMS9kU7mJHsMm5ej4paMgSRP/qzeuPA
	CaLTlfD3ci9rRLajRcy8XsEX2EbbomnJZ0iA8/ayhXGpCd0Y2qWReCuDAbLd638Ts2P1nAa2upT
	CIXvhmmcUmeJQIQrC+XaLtj1J39tEO2A=
X-Gm-Gg: AYBFou0Dim10izL3jeT2sWXT/mHf12uUVoMgmJJz4AK6saZv4cyhAJDYHP8QifAfs+x
	lAA7sxD6zXt50DaJXsFc1LZewF/j/Wfybyos2QV2BS3yY65+XKpI3ATxMU7iaR5+Se2iiPVn+b+
	gYGkpDYngfdw8rEPTSw84M4KiJY7hTr/GpzG7DxtASsQSKe6CvvporohDUFGbFItyv1jjnZRsg8
	ZGxbujeQuJZTScffnLZqlIzszBStE/H7msPsdOSUPKy1ddpRZvvpPSN/HmjBhMiFC8RDkcfzy9d
	y4l7LCq5QEiu6qwMwv3qy0Pnn8ILV6oJEnkAbhTzceW9U2uGHa87pzzn9CO7BAWL5njN/vIiTuu
	Dfzcz3SnGeMF+OkRDJs76tA+b5np3FcjZIMzbsUt86VfmzxqGH/y1vfYH3X3XPFsg8atsLSECdb
	5IMSXzJkxZtZhs86AbfM938WJadPd8ol6C5ypvkeJOa8U6PB24t3FOAeGYTg==
X-Received: by 2002:a05:690e:44c1:b0:67c:eb7:591b with SMTP id
 956f58d0204a3-67c56874f3bmr1312793d50.101.1794331461005; Tue, 10 Nov 2026
 09:24:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5362908d.bbe58.1a1c5478ed0.Coremail.18670333770@163.com>
In-Reply-To: <5362908d.bbe58.1a1c5478ed0.Coremail.18670333770@163.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Tue, 10 Nov 2026 12:24:09 -0500
X-Gm-Features: AclHuK-MprdJgw2nb-2txlHDI0mAPEfg7OJMq2S7_8BABehFMR4eJwlaO5aLFDg
Message-ID: <CAEjxPJ5tOwBfXpqbb_pFkjtHGtrHYL_idAj=es9QDGE1qPLDBA@mail.gmail.com>
Subject: Re: [SECURITY] remap_file_pages() skips the SELinux backing-file checks
To: n3rd <18670333770@163.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, "security@kernel.org" <security@kernel.org>, 
	=?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:46=E2=80=AFAM n3rd <18670333770@163.com> wrote:
>
>
> Hi,
>
> I am reporting a security bug in the Linux kernel.
>
> 1. Affected kernel versions
> Linux v7.3-rc7 (mainline; tested kernel 7.3.0-rc7, reproduced on two fres=
h boots), v7.3-rc6 (same code shape), and v7.2.9 (stable; mm/mmap.c:1143 is=
 the same call that is at mm/mmap.c:1158 in v7.3-rc7, and the SELinux side =
has the same selinux_mmap_file_common() and file-has-perm helper shape). On=
ly CONFIG_SECURITY_SELINUX=3Dy plus CONFIG_OVERLAY_FS=3Dy (which selects CO=
NFIG_FS_STACK) are needed. Not fixed in v7.3-rc7 as of this report; no CVE =
assigned. The dynamic verification was done on v7.3-rc7 only; the v7.3-rc6 =
and v7.2.9 statements come from a line-by-line source comparison.
>
> 2. Problem description
> remap_file_pages() is emulated in mm/mmap.c (SYSCALL_DEFINE5 at line 1101=
 in v7.3-rc7). It does file =3D get_file(vma->vm_file) at line 1153 and the=
n ret =3D security_mmap_file(file, prot, flags) at line 1158. On a stacked =
filesystem (overlayfs, erofs ishare, FUSE passthrough) vma->vm_file is not =
the file the caller opened: it is the FMODE_BACKING file that overlayfs ope=
ned with the mounter override credentials (fs/overlayfs/file.c:51, backing_=
file_open). The plain hook is therefore being handed a backing file. selinu=
x_mmap_file() (security/selinux/hooks.c:4172) calls selinux_mmap_file_commo=
n() with mounter_check=3Dfalse (line 4153), which reaches the internal file=
-has-perm helper with bf_user_file=3Dfalse (line 1764) and takes tsid_fd =
=3D selinux_file(file)->sid at line 1791. That fsec->sid is current_sid() a=
t file-open time (line 3853), which for a backing file is the mounter SID, =
so the fd use check at line 1797 runs from the caller SID to the mounter SI=
D and is denied when the policy has no such allow rule. The inode that gets=
 checked is file_inode(backing file), the real underlying inode, not the to=
p-level stacked file; backing_mounters_has_perm() (line 4056) is not called=
 for the intermediate layers; and fsnotify_mmap_perm() is not called either=
 (its only call site in the tree is mm/util.c:577 in vm_mmap_pgoff). The si=
bling paths do handle this correctly, which is what makes this an omission =
rather than a design choice: the mmap path has the dedicated security_mmap_=
backing_file() hook (security/security.c:2599, called from backing_file_mma=
p() at fs/backing-file.c:344) and the SELinux implementation at hooks.c:419=
6 uses mounter_check=3Dtrue; the mprotect path checks FMODE_BACKING explici=
tly in selinux_file_mprotect() (line 4215, check at line 4228) and then add=
s the intermediate-layer check plus a bf_user_file=3Dtrue check that uses u=
f_sid (line 1783). The upstream fix family 82544d36b172, 9fe595fad54d, 8c0c=
602202b9 and 78fc54b934bf covers the mmap and mprotect VMA paths only; the =
remap emulation was never converted. Effect: with SELinux enforcing and a m=
ulti-domain policy loaded, a confined process that calls remap_file_pages(2=
) on its own shared mapping of an overlayfs file is refused with EACCES, wh=
ile plain mmap and mprotect on the same file in the same domain succeed. In=
 our run, permissive mode logged avc: denied { use } with scontext user_t, =
tcontext mounter_t and tclass fd while the call returned 0; after switching=
 to enforcing the same denial was logged with permissive=3D0 and the call r=
eturned -1 with errno 13. The path also skips the top-level label recheck, =
the intermediate mounter recheck and the fanotify mmap permission event. Bo=
undaries, stated honestly: this is an access-control semantics defect, not =
a memory-safety bug (prot is reconstructed from the existing VMA, so no new=
 access right can be gained through remap), and KASAN, Oops, general protec=
tion and WARNING counts were all zero across both runs. We did not demonstr=
ate an end-to-end bypass where mmap is denied and remap is allowed for the =
same object, because that needs different labels on the top-level and backi=
ng files.
>
> 3. Reproducer
> A single statically linked C program (poc/sec03_poc, source poc/sec03_poc=
.c) runs inside a QEMU guest as root. It mounts selinuxfs, loads a self-bui=
lt minimal three-domain SELinux base policy generated from the target kerne=
l's own security/selinux/include/classmap.h (97 classes, 27 initial SIDs, c=
ompiled with checkpolicy), mounts overlayfs with tmpfs lower and upper, reg=
isters kprobes on security_mmap_file (filtered with flags & 1 to exclude th=
e process's own exec mappings) and security_mmap_backing_file, then dyntran=
sitions to the confined domain and maps the overlay file. The reproducer is=
 available on request; it is not included in this mail.
>
> 4. Conditions
> The file must live on a stacked filesystem and the caller must hold a MAP=
_SHARED mapping of it; the file has to be opened O_RDWR, because a read-onl=
y open makes do_mmap() clear VM_SHARED and the remap emulation then returns=
 EINVAL at its VM_SHARED check. No capability and no user namespace are req=
uired: the whole chain is one unauthenticated local syscall on the caller's=
 own VMA. SELinux must be enforcing with a policy that has more than one do=
main, and the kernel needs CONFIG_SECURITY_SELINUX=3Dy, CONFIG_OVERLAY_FS=
=3Dy and CONFIG_AUDIT=3Dy to see the denial. The test setup was x86_64, QEM=
U 6.2.0 with TCG, 2 vCPU, 4096 MB, initramfs, kernel 7.3.0-rc7, KASAN enabl=
ed as a control only.
>
> 5. Suspected location
> mm/mmap.c: remap_file_pages() emulation, file =3D get_file(vma->vm_file) =
at line 1153 and ret =3D security_mmap_file(file, prot, flags) at line 1158=
 (v7.3-rc7); the same call is at mm/mmap.c:1143 in v7.2.9. security/selinux=
/hooks.c: selinux_mmap_file() at line 4172, selinux_mmap_file_common() at l=
ine 4153, the internal file-map-prot helper at line 4091, the internal file=
-has-perm helper at line 1764 with tsid_fd =3D fsec->sid at line 1791, fsec=
->sid =3D current_sid() at line 3853. Correct-semantics counterparts: selin=
ux_mmap_backing_file() at line 4196, selinux_file_mprotect() at line 4215 w=
ith the FMODE_BACKING check at line 4228, backing_mounters_has_perm() at li=
ne 4056, selinux_backing_file_alloc() setting uf_sid at lines 3866 to 3875,=
 and the bf_user_file=3Dtrue branch using bfsec->uf_sid at line 1783. Gener=
ic layer: security_mmap_backing_file() at security/security.c:2599 (hook ta=
ble include/linux/lsm_hook_defs.h:204), backing_file_mmap() and vma_set_fil=
e() at fs/backing-file.c:329 to 344, ovl_mmap() at fs/overlayfs/file.c:468 =
to 476, fs/erofs/ishare.c:145. The missing companion check is fsnotify_mmap=
_perm(), whose only call site is mm/util.c:577.
>
> 6. Suggested fix
> Do not hand a possibly FMODE_BACKING vma->vm_file to the plain security_m=
map_file() hook from the remap emulation. Two options. In mm: reconstruct t=
he user file via backing_file_user_path(file) before calling the hook, or a=
dd an entry point symmetric to security_mmap_backing_file() (that hook alre=
ady takes the vma, so it can supply both prot and the user path). In SELinu=
x, as a catch-all that also covers future paths handing vm_file to a plain =
hook: make selinux_mmap_file() take the backing-file semantics when file->f=
_mode has FMODE_BACKING, that is use bfsec->uf_sid as the fd owner, use the=
 dentry from backing_file_user_path() as the checked inode, and add the bac=
king_mounters_has_perm() intermediate-layer check. It would also be good to=
 call fsnotify_mmap_perm() from the remap path so that fanotify permission =
events match the mmap path, and to add a self-test that asserts remap and m=
map reach the same SELinux decision on an overlayfs file. No patch has been=
 submitted by us.
>
> 7. Mitigation
> Until a fix lands, avoid calling remap_file_pages(2) on shared mappings o=
f stacked filesystem files from confined SELinux domains; the syscall is de=
precated and prints a pr_warn_once on first use, and mremap(MREMAP_FIXED) o=
r a fresh mmap can be used instead. Switching SELinux to permissive only st=
ops the denial from blocking the call, it does not fix the wrong object and=
 SID, so it is not a recommended mitigation. Deployments that rely on fsnot=
ify permission events for DLP or HSM range enforcement should be aware that=
 this entry point generates no such event. No kernel configuration switch a=
voids the defect; /sys/fs/selinux/enforce only decides whether the denial b=
locks the call.
>
> 8. Disclosure
> Public. This report is handled as a public report because it was produced=
 with AI assistance, following the kernel security process; no embargo is r=
equested. The reproducer is not published here and is available on request.
>
> 9. AI-assistance note
> AI was used: an AI coding assistant helped with source review, with build=
ing and running the target kernel, and with drafting this report. Per the k=
ernel security process, an AI-assisted report is treated as public.

Thank you for the bug report. For the SELinux fix, I would use the
existing mprotect handling as the reference: check the caller against
the saved opener SID and user-visible inode, and retain the mounter
checks on the backing layers. Calling security_mmap_backing_file()
alone wouldn't be sufficient, since the normal mmap path has already
checked the user-visible file before it reaches that hook.

I'd treat the missing fsnotify_map_perm() call as a separate
mm/fsnotify issue. It isn't specific to overlayfs and could be tested
on a regular file by having a fanotify pre-access listener deny a
fresh mapping of a page, then trying to remap to the same offset.

Could you provide Paul and me (and optionally Ondrej if interested)
with the reproducer source and test policy? Thank you.
