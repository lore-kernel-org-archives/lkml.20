Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94EC47AF68;
	Mon, 28 Sep 2026 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629406; cv=none; b=ZPemMzlpEtDEoj0BCWYHa2EKBMVLXe8AjOdsu9lZ3Z2rgFDUfFZ8obphxkozS7XqUQ4UCb7okDbnOybxODrnVB+JN3RydL5m3/IcZUehN598dH4JjxKDkvvCHA2RpkLMH37ETdXQ4CQktc3Qctp4VoqnrdN4SMHU74PrtiV7hwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629406; c=relaxed/simple;
	bh=81KJ3JqM+1k+n1v6q9w+1zoo6645pNbWs+88QNJdWp4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qNAoDiQnj3aY3kWsOY2rvVGi91s6iUKmjBp1aisZ4f45RhyzoJnq5Ekirn7DcstD36W/A8iM7hnEqpbLmtZiGdIpDqK42GfmphhnvmjmMo6RNtEi6+Bcpw9iUlmNaZqvxAZW+B+dH4hRoFqv3hiP7YqA4nO2JIHeZlcsL2x4GKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PgKrb0N4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PgKrb0N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790629402;
	bh=81KJ3JqM+1k+n1v6q9w+1zoo6645pNbWs+88QNJdWp4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PgKrb0N4kZC+wFpXYdIBlC7s59nGnWQX46UiOYxq1kEjFdsxoSSo/zRm7SMYEs5Uu
	 WEVA8RbFmS6Y9IwoVmHeSTiXAFH9ddXz8y7eLwHZCCPxWLlaF0OQikLGCtgJy/QYfB
	 U6qLJOMQ0fVzv4QXkNmrC1RC62GSJCVp9utM8f3iDj2ZjoczSZd6oGTbDX/2oLVolq
	 LVEJiiXoDhUv1voHiCv0FudzVrWw28kBrvs5vsvyyDHGxggoVO/Q1Um/rXXpR+BvnD
	 T0Wr8EI92luTTek1BrrLKeI/Iiph2bvdztKJSfZouQkn3bjF5ANMGiGVbSI4OJzFW3
	 LAA2UbK9mTp2A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C7FC17E0074;
	Mon, 28 Sep 2026 23:03:21 +0200 (CEST)
Message-ID: <bf9cb0dc0e6c6b313ca1491a068516bcf7aaffcc.camel@collabora.com>
Subject: Re: [PATCH v4] media: rkvdec: fix clk reference leak on unbind
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>, jonas@kwiboo.se, 
	detlev.casanova@collabora.com, hverkuil@kernel.org, mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar, heiko@sntech.de,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 17:03:20 -0400
In-Reply-To: <CAMhzubpF5UQZ6b3F9EUM7U_HJUJ6gB9Px-9v=dCW6v-4CVBLKw@mail.gmail.com>
References: <20260717154505.83935-1-pavone.lawyer@gmail.com>
	 <CAMhzubpF5UQZ6b3F9EUM7U_HJUJ6gB9Px-9v=dCW6v-4CVBLKw@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-sRZ1GkpALmFhvIbaGjyg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-sRZ1GkpALmFhvIbaGjyg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 27 juillet 2026 =C3=A0 17:11 +0200, Francesco Saverio Pavone a =C3=
=A9crit=C2=A0:
> Self-review after running this on a Rock 5B+. The reorder closes the
> clk leak, but it opens a window I missed when I sent it.
> Moving the PM teardown ahead of rkvdec_v4l2_cleanup() is necessary,
> for the drvdata reason in the commit message. The side effect is that
> video_unregister_device() is now the last thing remove() does, so
> /dev/videoN stays open-able while the empty IOMMU domain is already
> freed.
> A job queued in that window reaches rkvdec_iommu_restore() and touches
> the freed domain. Before the reorder, cleanup ran first and the window
> did not exist.
> Splitting the helper keeps both properties: unregister the media and
> video devices first, which stops new jobs, then tear down PM, then
> release the m2m and V4L2 device. Only that last step clears drvdata,
> so rkvdec_runtime_suspend() still finds its state.
>=20
>    cancel_delayed_work_sync(&rkvdec->watchdog_work);
>=20
>    rkvdec_v4l2_unregister(rkvdec); /* media + video unregister */
>=20
>    pm_runtime_dont_use_autosuspend(&pdev->dev);
>=20
>    if (rkvdec->empty_domain)
>      iommu_domain_free(rkvdec->empty_domain);
>=20
>    pm_runtime_disable(&pdev->dev);
>    rkvdec_v4l2_release(rkvdec); /* media cleanup, m2m, v4l2 */
>=20
> Running here on 7.2-rc5: unbind then rebind returns the rkvdec clock
> enable counts to their pre-unbind values and /dev/video0 comes back.
> I can send this as a v5 carrying both changes, or as a follow-up patch
> on top of v4, whichever you prefer.

Looking forward you v5.

Nicolas

> Thanks,
> Francesco
>=20
> Il giorno ven 17 lug 2026 alle ore 17:45 Francesco Saverio Pavone
> <pavone.lawyer@gmail.com> ha scritto:
> >=20
> > From: Jonas Karlman <jonas@kwiboo.se>
> >=20
> > remove() calls pm_runtime_disable() before
> > pm_runtime_dont_use_autosuspend(), so the second call can never suspend
> > the device: it reaches rpm_idle(), which returns -EACCES once PM runtim=
e
> > is disabled. The probe error path has had the two the other way round
> > since the driver was merged.
> >=20
> > This shows up when the device is unbound while the 100ms autosuspend
> > window is still open, which is what an rmmod right after a decode does.
> > device_release_driver() calls pm_runtime_put_sync() before .remove(),
> > and rpm_idle() adds RPM_AUTO on its own, so that put only arms the
> > autosuspend timer. pm_runtime_disable() then cancels the timer, and
> > pm_runtime_reinit() relabels the device suspended without calling the
> > driver back. The clk_bulk reference taken by rkvdec_runtime_resume() is
> > never dropped, and a later probe does not reclaim it, so every such
> > unbind leaks one enable count.
> >=20
> > Drop autosuspend first, so the callback still runs and releases the
> > clocks.
> >=20
> > The PM calls also have to move ahead of rkvdec_v4l2_cleanup() rather
> > than just swap with each other. rkvdec_runtime_suspend() looks its stat=
e
> > up with dev_get_drvdata(), and v4l2_device_unregister() clears it:
> > struct rkvdec_dev has v4l2_device as its first member, so
> > &rkvdec->v4l2_dev and rkvdec are the same address and the check in
> > v4l2_device_disconnect() matches. That is harmless today because
> > pm_runtime_disable() suppresses the callback, but once the callback can
> > run, a suspend after the V4L2 teardown dereferences NULL. Swapping only
> > the two PM calls oopses on every unbind.
> >=20
> > Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > [fsp: wrote the commit message; the diff is unchanged]
> > Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > ---
> > Changes in v4:
> >  - No functional change. Resent as its own thread (no In-Reply-To on v2=
),
> >    per Nicolas's note that a new version should be its own thread for
> >    patchwork tracking. Same diff and same commit message as v3.
> >=20
> > Changes in v3:
> >  - Rewrote the commit message, and dropped the VP9 claim from v1 and v2=
.
> >    Those said this fixed a VP9 inter-prediction bug on RK3588, green ch=
roma
> >    from the second ALTREF frame onward. The bug is real, but this is no=
t
> >    what fixes it, and I should have established that before sending v1.
> >=20
> >    What happened: I took this patch out of chewitt's tree along with tw=
o
> >    others and tested the three as a batch. The green is fixed by "media=
:
> >    rkvdec: implement reset controls" from Alex Bee, which adds the
> >    reset_control handling that recovers the VDPU381 after a transient e=
rror
> >    (COLMV_REF_ERR_STA and friends) instead of leaving it dirty for the =
next
> >    inter frame. Randy Li's PMU idle export goes with it. This patch was=
 the
> >    third one in that batch and got the credit.
> >=20
> >    Retested this week on the same Rock 5B+ with an unpatched driver: a =
VP9
> >    Profile 0 1080p clip with alt-ref frames decodes byte-identical to t=
he
> >    libvpx reference, across five rmmod/insmod cycles and after an unbin=
d
> >    inside the autosuspend window. The green does not come back, because=
 the
> >    reset_control work is in the tree I test on. Sorry for the review an=
d the
> >    testing you spent on that basis.
> >=20
> >  - Worth flagging separately: mainline rkvdec has no reset_control supp=
ort
> >    at all, so the VDPU381 is never recovered after a transient error. T=
hat
> >    is a real gap, it is just not this patch. I can write it up properly=
 if
> >    that is useful.
> >=20
> >  - The diff is unchanged from v1 and v2. It is Jonas's 2020 commit verb=
atim,
> >    and his original one-line subject already described exactly what it =
does.
> >    The wrong story was mine, not his.
> >=20
> >  - The subject changed with the message: "media: rkvdec: fix PM runtime
> >    teardown ordering in remove" in v1 and v2, "media: rkvdec: fix clk
> >    reference leak on unbind" here, since that is what it actually fixes=
.
> >=20
> >  - What is left is measured. With a dev_info() at the top of
> >    rkvdec_runtime_suspend(), autosuspend_delay raised to 60s to take th=
e
> >    timer out of the race, and unbind driven through sysfs:
> >        unpatched: 0 suspend callbacks, aclk_rkvdec0 enable_count 1 -> 2
> >        patched:   1 suspend callback,  enable_count 1 -> 1
> >    The leak survives rmmod and accumulates one per unbind. With
> >    autosuspend_delay=3D0 both orders suspend once, which is the control=
: the
> >    difference only exists inside the window.
> >=20
> >  - Fixes: was wrong in v1 and v2. ff8c5622f9f7 has the two pm_runtime c=
alls
> >    as context and only added iommu_domain_free(). cd33c830448b added re=
move()
> >    with the reversed order, and the probe error path with the right one=
, so
> >    the tag points there now.
> >=20
> >  - Dropped Cc: stable. A clk reference leaked on unbind is not backport
> >    material, and the tag was only there for the VP9 claim.
> >=20
> >  - Dropped your Reviewed-by and Tested-by from v2: they were given for =
a fix
> >    to something else.
> >=20
> >  - Not included, happy to send as follow-ups: clearing empty_domain aft=
er
> >    iommu_domain_free(), and hoisting the unregisters to the top of remo=
ve()
> >    as you suggested on v2.
> >=20
> > Tested on a Radxa Rock 5B+ (RK3588) on a 7.1 tree where the six calls i=
n
> > rkvdec_v4l2_cleanup() are open-coded; the executed sequence is the one =
this
> > patch produces. VP9 decode stays byte-identical to libvpx, and five
> > rmmod/insmod cycles leave dmesg clean.
> >=20
> > Link to v1: https://lore.kernel.org/all/20260518105413.42147-1-pavone.l=
awyer@gmail.com/
> > Link to v2: https://lore.kernel.org/all/20260518145414.64514-1-pavone.l=
awyer@gmail.com/
> > Link to v3: https://lore.kernel.org/all/20260717150440.77079-1-pavone.l=
awyer@gmail.com/
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/=
media/platform/rockchip/rkvdec/rkvdec.c
> > index 1d1e9bfef8e9..0ec3fca9cccc 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -1869,12 +1869,13 @@ static void rkvdec_remove(struct platform_devic=
e *pdev)
> >=20
> >         cancel_delayed_work_sync(&rkvdec->watchdog_work);
> >=20
> > -       rkvdec_v4l2_cleanup(rkvdec);
> > -       pm_runtime_disable(&pdev->dev);
> >         pm_runtime_dont_use_autosuspend(&pdev->dev);
> >=20
> >         if (rkvdec->empty_domain)
> >                 iommu_domain_free(rkvdec->empty_domain);
> > +
> > +       pm_runtime_disable(&pdev->dev);
> > +       rkvdec_v4l2_cleanup(rkvdec);
> >  }
> >=20
> >  #ifdef CONFIG_PM
> > --
> > 2.54.0
> >=20

--=-sRZ1GkpALmFhvIbaGjyg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrWGAAKCRDZQZRRKWBy
9E10AQCxxlh9dzHcaj7jhYbzOKhmJWGxNyUP/1PjPIzHbDr+1wD+OFF5FiQTa6gT
Kd6tVo3QC/FEnPE21mIL93HAl9tk0A4=
=tcOz
-----END PGP SIGNATURE-----

--=-sRZ1GkpALmFhvIbaGjyg--
