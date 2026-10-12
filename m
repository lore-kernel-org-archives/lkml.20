Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912D329C48
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811635; cv=pass; b=lahewnjNAW6s9+b6o9a209Hg4oTrOcIczQtdGisOxhOTfaPJIR59rCgn6bXxWLPtNVlIbemm6hhioOwqPVmK9hAk8TBvhdIrwlO6ooJwRbEllsa2C6fJlxGDfrOiiOC/kaD/Kz6CTONw2O/1vAhL6hgb2kYJ8J+8tSoHElvQNrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811635; c=relaxed/simple;
	bh=H1ij3QKS5qeQ8I9kWjLPeoZQzraYJLNvQBCNmgOu4Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHfyeeM/P/OiOzMelZHEHe++6tdWxX7clSCHSahtXBz2nyFA/iLzJ6A1CBFkkcwTUI9eImo4Y333qyp+POithL0Zu0bsng+hCGvcq7lbgbY7mjP5zf3XOWrBpgOR8SGNfZoUwdiwxlXMQ4m8Zsx29OfuyK6AvXD/ypil2veyIY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCGdAQf0; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCGdAQf0"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2496357a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791811631; cv=none;
        d=google.com; s=arc-20260327;
        b=o6MDBAIwsbhOJIDJGm7ijPQ1gYm7CZXYq8QbHaEmN3pESpkbSGZLipnB5EbynBGXS6
         BIw9AOWJUab7HYdKv2ciHkXMDvYsrWZGMis/uBO/7u6YZy2vqk5vrhdeG5D/6Ooa5wyB
         8ic0qKbKzofhOUOQbmZeBszIqLj9FcBuDvlQd/TQ0rn6YP6ToA44Sr7dG7BT0d14OQuC
         nU3uZy6VZlReLs0KBSsgWkS9aIxN0VYepRBDMuIqk/wMcn2zpBtcGynWTEejjluJuj4o
         34cKCm4yxT+PiWMq91W/VoWTz+ULrlXHxMaEjC+C0UtfCo3uH1wdJ/vTIaV9R3eskmob
         DAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X/4mrz+vSyH7lWEhdqkYudRoi8+AIdRLYSG2FULjFno=;
        fh=MAlaOwXiYQFnH2u3QehGotNOw9c3+rgZxm6MSTj9xDo=;
        b=qkkIu0pbvLiraQAVqA1ygqaOnIvihj3+8OfZ9N0TOgBZtqCkfujPDJDTNN7O1hxSrm
         tAgPMnjWDmty6GRiUMrtzbH9b0u8I7a9FJaOvS2FIA2pOz+Hf7nrma0+ZK8DXtDnaCGg
         DPubTOq8/Rzf8tbOpBY36k9bdtNqEdsKEtjfh8XBrrCjuFnC99J/GzYBhbunZmB/Ox+E
         MrBjk5Bv1YpuKAU3pflItNGA9+B9q7ZP6jeXFjpk7gIGUOOGoIO4oxQb2zcIgINv29YE
         g1aGnJ7pxVwJvCqdAIQw4clGsT+nL87yeTFR947RjaOGj3uQotntK7BBJYqV/YYddc8D
         ahyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811631; x=1792416431; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/4mrz+vSyH7lWEhdqkYudRoi8+AIdRLYSG2FULjFno=;
        b=cCGdAQf0+3Itjc3MKuxP49XEi7k5GoGBc5Q6YEfIt/FP8tg/3TMyfScM6qmh/JGVhg
         kKvDkG5n/08qS1grGTQFJBURDV2Hd0tAVX9qHZ1bdZe54pdLb7Uoo9t5W3oWmIQBGsY6
         5j0UvYCHVP3gzM9aGsts08uaSr3zFGx0rYA0dMDIiydKKZHIEZSmQQAr6uHAOtG93pG2
         byej2iAOZ2sLbc8Pb05/WBNmkKjDNyRTsLXW/D75VWBPWMBwPGltrKl/HCAv4gx98TCS
         Y2Hm/a8hY1JIiUAKELoLny5PyiB04TScIoIt13LDlxUzelQgYcYoVAlCUmETOsb6QFd4
         SzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811631; x=1792416431;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X/4mrz+vSyH7lWEhdqkYudRoi8+AIdRLYSG2FULjFno=;
        b=wVyu2kUSUjgiNTri+RwGC2GH3GmhgmrthumMY5GvqzbjyPMmFfZ8U+8pmZXEfaanei
         roGs+xfbPwhHYk/KEyhLPHTi9sTDztG34hXM4Kr9U08D+NGkCKI1x+GRM52Aw6ae8ibE
         XhOInK2qkO84OJFvWA3IqWIuoXgLEZfEukgf9ovr07wYmLe33F91itZfAhurGVBZ7GrK
         BKJRzsLT2mOXbaXBrYRPd4hjS8RrJWCO7Bxue08uL6AUw/KAEOr6GmNuB864gdQxaJK9
         i1xYuSws0XdlecSBqtxtSKbkX1/BY+n8jHNBHd0Otcr52oHLi4VhFzGiTGGQFDt/lekI
         7DGQ==
X-Forwarded-Encrypted: i=1; AKwUvBymh0P1QUOGNkGuOJs6m35KvxYQst9nJy8e0/MwbIHcreg27aS8t02izm8zEjBazpV2yX4miY1wRAHrXNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSw2FXX8jytKwvdRJrsqviAHvfOZIJRgoie0g+4Wpd5cChHBvJ
	Jee6qw76OkLJj7z8M/JON9Nu5MWBNG2ineAqQOodzztWucRmIRKpQjou+nuy6AEZw5uK0qe7Ycd
	oQLWLfhI51p3YrVQAN+mq4b1lJlRtysc=
X-Gm-Gg: AYBFou3rzhsQBebv7mFIw3PNxUYNIYIGL2jMizA7BPhBWwQ70kYGcNdUsqyGU/+0/Hl
	kA+qNPJwspqR/5z9+UgEn/r1HkCaCYzqft2B1SMnfMnfWogTdpJmPe2OdTO6pgZbHsS427e9PoX
	x3cqW2TP+CKOJe8NQZr4+QwwPm49ZcHGIoKIKg+kZYD8yJwrYHcn/7pOPQJ+p1xaSFFnVmMk1cZ
	JM9DA1tp1xoLxuX0idEE93evmKxRTBI4+Mv99Jl03C1h6MkvKBZWoDNet/af9hVzL6KaleP7XsV
	3TQVD0VaxXj41xTGdTaJe9FozTEF6msl9XO08sMlbGWOAXvYTo4r8KC0tzGtmHKePq4=
X-Received: by 2002:a05:6402:27d3:b0:6b1:ceab:697c with SMTP id
 4fb4d7f45d1cf-6b1ceab70fcmr1332114a12.9.1791811631065; Mon, 12 Oct 2026
 06:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827045007.3831259-1-4ncienth@gmail.com> <yjfqzckumtd32dgqidi5sndvth2t67mjwah4kt4jiahlx2a5uf@if55sinfv5o7>
 <20260828042421.964822-1-4ncienth@gmail.com> <ptco7s5x7tjzp42dzlsitibdigpwucl2whwrq37tknjpo7x2lc@b7q27ldlorak>
 <CAOQ4uxgB9anyJcWem04w65VCJdxbbb2cQDZ_u8qMusw3xpB9Gw@mail.gmail.com>
 <63aj7jbfaoamdmcurlge2c2kqpliaifgq4vbythrrxpfyr5vtm@z64myom426zd>
 <CAOQ4uxh-NZ76hEFoNNGjyhodr9U=dvZuGVmYHVPGZ_=jRxCAsA@mail.gmail.com>
 <67hq7zqnvp6onwwjp24axucgxbzsko2dphielupdfzmfyk6x57@bdeef7fjkqfa>
 <CAOQ4uxiQF4M_YSBMW3h8VCKR15GV6g_K5nf=2odtYetEwKHm9A@mail.gmail.com>
 <6n6r5zvcu5ojihyb52rhejlky7xrn2a2p4l2cgfut5lsscunek@bcnpy7bifjrs>
 <CAOQ4uxjbEY12XMmfCXTPTpASmECCXcGBQR+bS93k=4vgqzFDZA@mail.gmail.com>
 <20260902070359.4163607-1-4ncienth@gmail.com> <CAOQ4uxjwGdKhX423KoFxW+T5hc9uzCWSsGwn0-QX=CJipPSaYQ@mail.gmail.com>
 <20260902215046.1149198-1-4ncienth@gmail.com> <CAOQ4uxhuOSyMHnj9JZk6LU9=wpE=BRFXJ3fSEOGGV+6tC_5hfg@mail.gmail.com>
 <CAOQ4uxgiub97wtDpWx6n+p4EBuusSp4xKm+b1Xa_GBAHH8=i=g@mail.gmail.com>
In-Reply-To: <CAOQ4uxgiub97wtDpWx6n+p4EBuusSp4xKm+b1Xa_GBAHH8=i=g@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 12 Oct 2026 15:26:59 +0200
X-Gm-Features: AclHuK-_0wMMY11ZJYL05XMj1P1Z1SdqBTHar__c-8kEUEzh_zgIFU7OXSwrctk
Message-ID: <CAOQ4uxg7Qt436SiKhKEJKOjtCjeB_XyTjazYF7HMyQAGGcgx2A@mail.gmail.com>
Subject: Re: [BUG] fanotify: destroy/add race leaves a mark on a detached connector
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daehyeon Ko <4ncienth@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000c67580065da4a79a"

--000000000000c67580065da4a79a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:48=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Thu, Sep 3, 2026 at 3:07=E2=80=AFPM Amir Goldstein <amir73il@gmail.com=
> wrote:
> >
> > On Wed, Sep 2, 2026 at 11:51=E2=80=AFPM Daehyeon Ko <4ncienth@gmail.com=
> wrote:
> > >
> > > Hi Amir,
> > >
> > > I was able to make the handle-reopen sequence reliable on ext4 and dr=
afted
> > > an LTP test for it.
> > >
> > > The test keeps 120 auxiliary inode marks on the victim to widen the i=
nterval
> > > after the first FAN_DELETE_SELF, pins the unlink and handle-reopen wo=
rkers to
> > > different CPUs, and has the reopen worker read the event queue nonblo=
cking
> > > before calling open_by_handle_at().
> > >
> > > I ran the exact final test for 100 iterations in each of two fresh 2-=
vCPU
> > > KASAN boots per kernel:
> > >
> > >   - unmodified v7.2: 200/200 iterations reopened the unlinked inode, =
and
> > >     closing the reopened fd generated a second FAN_DELETE_SELF;
> > >   - v7.2 with your patch: 200/200 iterations returned ESTALE from
> > >     open_by_handle_at(), with no duplicate FAN_DELETE_SELF.
> > >
> > > The test is based on LTP master commit
> > > 12724413534a6d4160ff9694ba6f09daa4ccb6bd. The attached patch adds
> > > fanotify26 and the corresponding build and runtest entries.
> >
> > Very nice!
> >
> > I think we should wait for Christian to pick up the fix or suggest an
> > alternative, but after that please post this test to LTP.
> >
> > Thanks for following up on this!
>
> Christian,
>
> Please apply this attached patch in-place of 669bb5af15d41 ("fs: make
> sure to call fsnotify_inoderemove() only once when inode is dead") on
> your vfs-7.4.misc branch.
>
> The difference from v1 [1] is removal of the obtain_alias parts, which ar=
e
> wrong for network filesystems.
>
> The LTP test provided by Daehyeon now fails because it uses open_by_handl=
e_at()
> for the reproducer, but a similar race could be created with hardlinks
> release/unlink race and this case should be fixed by this v2, meaning tha=
t
> FS_DELETE_SELF is reported when all hardlinks are unlinked and all
> open files to all hardlinks are closed.

Sorry I forgot to update the comment.
Attached v3 with the comment change.

Thanks,
Amir.

>
> [1] https://lore.kernel.org/linux-fsdevel/CAOQ4uxjbEY12XMmfCXTPTpASmECCXc=
GBQR+bS93k=3D4vgqzFDZA@mail.gmail.com/

--000000000000c67580065da4a79a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="v3-0001-fs-make-sure-to-call-fsnotify_inoderemove-only-on.patch"
Content-Disposition: attachment; 
	filename="v3-0001-fs-make-sure-to-call-fsnotify_inoderemove-only-on.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mv5abq3o0>
X-Attachment-Id: f_mv5abq3o0

RnJvbSBmZjkxZTEzODQ3YTVkYmVlNGU4NjRhNDdiZTViZjRiY2M4MTk5Yjc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpE
YXRlOiBXZWQsIDIgU2VwIDIwMjYgMTg6NDk6MjUgKzAyMDAKU3ViamVjdDogW1BBVENIIHYzXSBm
czogbWFrZSBzdXJlIHRvIGNhbGwgZnNub3RpZnlfaW5vZGVyZW1vdmUoKSBvbmx5IG9uY2UKIHdo
ZW4gaW5vZGUgaXMgZGVhZAoKRGFlaHllb24gcmVwb3J0ZWQgYSByYWNlIHdoZXJlaW4gZnNub3Rp
ZnlfcmVtb3ZlaW5vZGUoKSBjYW4gYmUgY2FsbGVkCndoZW4gaW5vZGUgc3RpbGwgaGFzIGEgbGl2
ZSBhbGlhcy4gIFRoaXMgY2FuIGxlYWQgdG8gc2V2ZXJhbCB1bmRlc2lyZWQKb3V0Y29tZXMgc3Vj
aCBhcyBjcmFzaGVzIGluIGZzbm90aWZ5IGNvZGUgb3IgYXZvaWRhbmNlIG9mIGlub2RlIG1hcmsK
bm90aWZpY2F0aW9ucy4KCkNoZWNrIHRoYXQgaW5vZGUgaXMgcmVhbGx5ICJkZWFkIiwgbWVhbmlu
ZyBubyBubGluayBhbmQgbm8gbW9yZSBhbGlhc2VzCmJlZm9yZSBjYWxsaW5nIGZzbm90aWZ5X2lu
b2RlcmVtb3ZlKCkgZm9yIGZpbmFsIGNsZWFudXAgb2YgaW5vZGUgbWFya3MuCgpJZGVhbGx5LCB3
ZSdkIGNhbGwgZnNub3RpZnlfaW5vZGVyZW1vdmUoKSBvbmNlIGxhc3QgaW5vZGUgcmVmZXJlbmNl
IGlzCmRyb3BwZWQgdG8gbWFrZSB0aGluZ3Mgc2ltcGxlci4gQWxhcyBmc25vdGlmeSBpbm9kZSBt
YXJrcyBjdXJyZW50bHkgaG9sZAppbm9kZSByZWZlcmVuY2VzIGFuZCB0aHVzIHRoaXMgZG9lc24n
dCB3b3JrLiBPbmNlIHdlIHRlYWNoIGZzbm90aWZ5IHRvCmF2b2lkIGhvbGRpbmcgaW5vZGUgcmVm
ZXJlbmNlcywgdGhlc2UgZ2FtZXMgd2l0aCBkZWFkIGlub2RlcyBjYW4gZ28gYXMKd2VsbC4KCk5v
dGUgdGhhdCBhIG5ldyBhbGlhcyBjb3VsZCBiZSBjcmVhdGVkIGJ5IG9wZW5fYnlfaGFuZGxlKCkg
dG8gYW4gaW5vZGUKdGhhdCBoYXMgYWxyZWFkeSByZXBvcnRlZCBGU19ERUxFVEVfU0VMRi4gIFRo
aXMgY2FzZSB3aWxsIGJlIGhhbmRsZWQgYnkKYSBkaWZmZXJlbnQgcGF0Y2guCgpSZXBvcnRlZC1i
eTogRGFlaHllb24gS28gPDRuY2llbnRoQGdtYWlsLmNvbT4KQ2xvc2VzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMjYwODI3MDQ1MDA3LjM4MzEyNTktMS00bmNpZW50
aEBnbWFpbC5jb20vCkNDOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEFt
aXIgR29sZHN0ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2gubXNn
aWQubGluay8yMDI2MDkwMjE2NDkyNC4xMzMzMTM1LTItamFja0BzdXNlLmN6Ci0tLQogZnMvZGNh
Y2hlLmMgfCAxNCArKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9kY2FjaGUuYyBiL2ZzL2RjYWNoZS5j
CmluZGV4IGI4OWM4NDgwYjY1NWIuLjg2YTNhMDA5MjlkZTEgMTAwNjQ0Ci0tLSBhL2ZzL2RjYWNo
ZS5jCisrKyBiL2ZzL2RjYWNoZS5jCkBAIC00NTAsNiArNDUwLDE2IEBAIHN0YXRpYyB2b2lkIGRl
bnRyeV9mcmVlKHN0cnVjdCBkZW50cnkgKmRlbnRyeSkKIAkJY2FsbF9yY3UoJmRlbnRyeS0+ZF9y
Y3UsIF9fZF9mcmVlKTsKIH0KIAorLyoKKyAqIFdoZW4gaW5vZGUgaXMgdW5saW5rZWQgYW5kIGRv
ZXNuJ3QgaGF2ZSBhbnkgYWxpYXNlcyAoaS5lLiwgYWxsIGZkcyBwb2ludGluZworICogdG8gaXQg
YXJlIGNsb3NlZCkgd2UgcmVwb3J0IEZTX0RFTEVURV9TRUxGIHRvIGZzbm90aWZ5IGFuZCBjbGVh
bnVwIGFsbCBpbm9kZQorICogbWFya3MuCisgKi8KK3N0YXRpYyBib29sIGlub2RlX25vdGlmeV9k
ZWFkKHN0cnVjdCBpbm9kZSAqaW5vZGUpCit7CisJcmV0dXJuICFpbm9kZS0+aV9ubGluayAmJiBo
bGlzdF9lbXB0eSgmaW5vZGUtPmlfZGVudHJ5KTsKK30KKwogLyoKICAqIFJlbGVhc2UgdGhlIGRl
bnRyeSdzIGlub2RlLCB1c2luZyB0aGUgZmlsZXN5c3RlbQogICogZF9pcHV0KCkgb3BlcmF0aW9u
IGlmIGRlZmluZWQuCkBAIC00NTksNiArNDY5LDcgQEAgc3RhdGljIHZvaWQgZGVudHJ5X3VubGlu
a19pbm9kZShzdHJ1Y3QgZGVudHJ5ICogZGVudHJ5KQogCV9fcmVsZWFzZXMoZGVudHJ5LT5kX2lu
b2RlLT5pX2xvY2spCiB7CiAJc3RydWN0IGlub2RlICppbm9kZSA9IGRlbnRyeS0+ZF9pbm9kZTsK
Kwlib29sIG5vdGlmeV9kZWFkOwogCiAJcmF3X3dyaXRlX3NlcWNvdW50X2JlZ2luKCZkZW50cnkt
PmRfc2VxKTsKIAlfX2RfY2xlYXJfdHlwZV9hbmRfaW5vZGUoZGVudHJ5KTsKQEAgLTQ2OSw5ICs0
ODAsMTAgQEAgc3RhdGljIHZvaWQgZGVudHJ5X3VubGlua19pbm9kZShzdHJ1Y3QgZGVudHJ5ICog
ZGVudHJ5KQogCSAqLwogCWRlbnRyeS0+d2FpdGVycyA9IE5VTEw7CiAJcmF3X3dyaXRlX3NlcWNv
dW50X2VuZCgmZGVudHJ5LT5kX3NlcSk7CisJbm90aWZ5X2RlYWQgPSBpbm9kZV9ub3RpZnlfZGVh
ZChpbm9kZSk7CiAJc3Bpbl91bmxvY2soJmRlbnRyeS0+ZF9sb2NrKTsKIAlzcGluX3VubG9jaygm
aW5vZGUtPmlfbG9jayk7Ci0JaWYgKCFpbm9kZS0+aV9ubGluaykKKwlpZiAobm90aWZ5X2RlYWQp
CiAJCWZzbm90aWZ5X2lub2RlcmVtb3ZlKGlub2RlKTsKIAlpZiAoZGVudHJ5LT5kX29wICYmIGRl
bnRyeS0+ZF9vcC0+ZF9pcHV0KQogCQlkZW50cnktPmRfb3AtPmRfaXB1dChkZW50cnksIGlub2Rl
KTsKLS0gCjIuNTUuMAoK
--000000000000c67580065da4a79a--
