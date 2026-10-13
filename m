Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F05372DC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922884; cv=pass; b=ms2ItWewMejrWFwxMPlvT6MHWGLdSUoXFrueW8a3Y1uMu6FkLYefwSchbXjFUgfYXmRtZ9FW6RJSzVVE3/cGiAvX297Qzv5KJykNZfetxKfd+nc5jHg4fyhiRV/Qg7dmZCanWeJ/LWq+OHRQgo7S7i96Se0gU03As5U/OIgqSvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922884; c=relaxed/simple;
	bh=xxOvf721KgqJqT5Yjw9s9kJ3wImugFlnKAyCSgeC05M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pC4KZTGOsJIsgv+HyRJwMIRfiDmIen6DMpzoYrDUL06ImeImz3xe2yxb1aLriIPD5UGK9evjDFtFkQzHXLRsswBy7WDQhGbAJQwlxOrjYJbuhrzm1SsJjj0tZU1edqAHftSunffDq2dEiY2J7mdw/hxCK7AaUBMSIj8/mn4Ro9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QIjYCQGT; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QIjYCQGT"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5337fa12431so961781cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791922882; cv=none;
        d=google.com; s=arc-20260327;
        b=B8TR2j4VuqVv6ruMX2eVY9cruvVdTb9JXal3aM6sjo+hOcp9/vz87QO20FygS0qCAJ
         d/TlTc3/z7+J0ZxDBunF1qF45cwD8DdFIvK6i/XS7lyektNoe3faYPqlofi6O6v63aSL
         GWKXmza3+9oS669d1yVCzpgQrUe7OHm3aUDktYCiJxRLEnSP4tuRP3+5zw9RVasno6Pm
         hYlLOhltlwrLSN3z9VUbAFM/qKU+ev+Wg1kJwpbOLwJrJr3bIZGpzm+6RnxvcW8Dpg/9
         wowXKLRixY3C5i8Qy69PY0ZzVWXgKRWsHgHLuWnG9evsowpYrMsoII2hBIF3OV58GU+B
         HB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Uu3Iqv0t79GTDrfZYBvAaVsbzV6bjgjtd2RimZpM59Y=;
        fh=UeTpewyogaZLouDz5r2yGXDrZ+CWL92J7jcDf/J7Cvg=;
        b=q5yFk9TBijcpvsgtEaJbGO8cjTsnxn3BYLqIEovYMKcT9ugc/vcaGh3rumtwRBF4Vt
         0hfTA/Jn0yu6xjyF0AJWRMwKu7dwfr7zpPPJeciPLfW0iChXzbyYlrsC9o8ijOkKtFnn
         UaHAhU/wO41XZhQh4rQ0LWrN3fCMzNLqXsKTldm3HYJsiEr2eRBgPqtOQscTVwug2k3m
         sUYC0Pji1B3NaVDzkgqiX+oQC3z3ipbaQyv3vTAkf3fq15tbFXlJopymEyNzxyXm/JG0
         q8zPAZ35tj7BxDAnk/YsohPeGco/WpWqf5BbkDqDI0pDbU6FstqoEjgnApd9UCPLHxpF
         RixA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791922882; x=1792527682; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uu3Iqv0t79GTDrfZYBvAaVsbzV6bjgjtd2RimZpM59Y=;
        b=QIjYCQGT+H4hszH5mOwWUc5PNfvh8UxbSKqNUjJgh9bH5N7VdgEuDC0eCPCh4HPUbC
         +TTiEXqXW/1anIkT5lvidfk3SL4vi9e3OgBKGCBpzawd5R41iZkvNzFGDCfc40R6Ci8k
         9x28NKt0b4jPqCd3QY5iPhH37ndrm+n+UYUhcH4Qh2b0/LEPlt6vPOkk78JyuXDZBZO2
         ZHETzwKvhDg6dZ0nx4+sLhYmM1ljGQHhVCEPksumxMdHNbHMF9pv+zMa5piA1Ou1h8A9
         O/KztmmwPtN5LbHjDgAVU4zSMMNIJGWVrp0JmaDHlw2L6EwZLt9utV668IXtuLNrduJe
         3HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922882; x=1792527682;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uu3Iqv0t79GTDrfZYBvAaVsbzV6bjgjtd2RimZpM59Y=;
        b=z+P/dCMyUk8orMLfc81KvEicLDVwahIA0lcruFzGGrT5oqRmKJLD/dy5LwdaZBlZSO
         N8r8Z6bcH6hYVBHbJWbGJqDl0xyvbf3OnJG6Wk1EAgeBy92NHuooNwx7yY6xAa15FncI
         uwFboVFkqMwL8xkH9Hz7Vnk84Byk/bIpE3Vm+iYFoCe5xyajgkJLBtBP76j6Wibq0YGB
         3mFCgFhHtU4pU+wpO9CiJc7Fag64BPwrREr+fIENh2vaKJG8A8My+CsE996Q6uCcrlXg
         w5fa7SU9kgupWeH2jid3eNx4hMqOmyFd8DCt/sJZPfuwTfv47eZ0C9R9ad5jfXsAqk/Q
         OJVg==
X-Gm-Message-State: AFq9FYI+ESoJZrM8ajgprnxO1I+j1o7u7Nh6toUCz34PDd2rbSyrDHsk
	6nO7Hkyh6iSMXDgnK+TsCv/wiqLnG+nAQgzWD4F7I2Ep0VLcoahoZ46liG1QclpGm2wfbZSO8L+
	ZQY3oknAYc3lJ5fXW4YWkddlHOmy5zpVT2QzrPV7B
X-Gm-Gg: AYBFou2EMcGoHQ2OVKPMrY7NECX0hAZYb0OSbRSefqTLVh3/vqUBZA0KHB2YNujYIWe
	Wy4T3ppWJkw+Hp2a+LCGE4Ab/asCIRxBRY8LSrgLkpm5/xvrwl7yHN16Hfxk4U1tnHvcF7iGMqk
	Byhuvv4/KCPl55JK63JmQuMuC2Be62vgNnPGMKTrc4hKXA21YA9b9C7lEb7moXIN56aa/7VKotP
	gEOLCpLo6mMqYXzcyQn5TmPqF+6VE8KH7PBFAaFkWf/+97t8o17ol/Tu1OWScpDwPG1houGWT0o
	MXjQuVmxuu8Q+5FhGz+u70HGNNIZ++5S7Ui+20VEbnGrx7nuVQsWgDSs0Wg9rsEQL7h+Oz04kSH
	C+J7oXG5giQbkBTVlyuwY6UEm
X-Received: by 2002:a05:622a:1ba0:b0:534:313:9b4e with SMTP id
 d75a77b69052e-535b321298dmr57512211cf.5.1791922880608; Tue, 13 Oct 2026
 13:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sadrul Chowdhury <sadrul@google.com>
Date: Tue, 13 Oct 2026 16:21:08 -0400
X-Gm-Features: AclHuK9Vyag4IawcrZG5-4LpkcYucq7mjmH0zXviiwtdCJ8nVZ-d17BCJwjshGc
Message-ID: <CAKgcGXh-qG4LD70wSJMtfadXk+a9XaayfwtzGe3F0LbekYMOmw@mail.gmail.com>
Subject: [RESEND] Re: [PATCH 1/2] fs/epoll: mark epoll_wait tasks TASK_FREEZABLE
To: Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Pavel Machek <pavel@kernel.org>, linux-pm@vger.kernel.org, 
	John Stultz <jstultz@google.com>
Content-Type: multipart/mixed; boundary="000000000000c552f3065dbe8eaa"

--000000000000c552f3065dbe8eaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:21=E2=80=AFAM Sadrul Chowdhury <sadrul@google.com=
> wrote:
>
> On Wed, Sep 23, 2026 at 7:24=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> >
> > On Tue 22-09-26 21:15:58, Sadrul Chowdhury wrote:
> > > During system suspend (freeze_processes) and resume (thaw_processes),
> > > threads blocked in epoll_wait() sleep in TASK_INTERRUPTIBLE. When
> > > try_to_freeze_tasks() executes, it must wake up every sleeping thread
> > > with a synthetic signal so the thread can schedule, run try_to_freeze=
(),
> > > enter TASK_FROZEN, and sleep again. Upon resume, the freezer wakes th=
em
> > > all up simultaneously, only for each thread to re-enter ep_poll(),
> > > observe no ready I/O events, and call schedule() to go back to sleep.
> > >
> > > On systems with numerous event-driven daemons (where hundreds of
> > > threads idle in event loops), this causes a large wakeup stampede and
> > > thousands of redundant context switches per suspend/resume cycle.
> > >
> > > An earlier attempt to make epoll_wait() freezable in commit 1c441e921=
201
> > > ("epoll: use freezable blocking call") was reverted in commit
> > > c511851de162 ("Revert "epoll: use freezable blocking call"") due to
> > > reports of userspace corruption (Bugzilla #61781). Under the legacy
> > > freezer design, freezable tasks could wake up prematurely while
> > > hardware and peripheral drivers were still suspended.
> > >
> > > With the 2022 core freezer rewrite (commit f5d39b020809 ("freezer,sch=
ed:
> > > Rewrite core freezer logic")), the legacy fake-signal mechanism was
> > > replaced with the TASK_FROZEN state. Tasks sleeping in TASK_FREEZABLE
> > > are safely frozen in-place without waking them up, and the scheduler
> > > guarantees they cannot be woken until thaw_processes() explicitly cle=
ars
> > > the frozen state.
> > >
> > > Mark sleeping tasks in ep_poll() as TASK_FREEZABLE. Benchmarks on an
> > > ARM64 test device demonstrate that combining this with freezable
> > > select/poll reduces thaw latency by 63% (from 20.64 ms down to 7.55 m=
s
> > > mean at fixed CPU frequency) and reduces context switches during
> > > freeze/thaw by 87%.
> > >
> > > Signed-off-by: Sadrul Chowdhury <sadrul@google.com>
> >
> > With similar caveat as on patch 2/2 feel free to add:
> >
> > Reviewed-by: Jan Kara <jack@suse.cz>
> >
>
> Thank you for the review!
>
> Regards,
> Sadrul
>
> >                                                                 Honza
> >
> > > ---
> > >  fs/eventpoll.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> > > index 6cbef8b4c2e0..35992f6457bf 100644
> > > --- a/fs/eventpoll.c
> > > +++ b/fs/eventpoll.c
> > > @@ -39,6 +39,7 @@
> > >  #include <linux/rculist.h>
> > >  #include <linux/capability.h>
> > >  #include <net/busy_poll.h>
> > > +#include <linux/freezer.h>
> > >
> > >  #include <trace/hooks/fs.h>
> > >
> > > @@ -1987,7 +1988,7 @@ static int ep_poll(struct eventpoll *ep, struct=
 epoll_event __user *events,
> > >                * the same lock on wakeup ep_poll_callback() side, so =
it
> > >                * is safe to avoid an explicit barrier.
> > >                */
> > > -             __set_current_state(TASK_INTERRUPTIBLE);
> > > +             __set_current_state(TASK_INTERRUPTIBLE | TASK_FREEZABLE=
);
> > >
> > >               /*
> > >                * Do the final check under the lock. ep_start/done_sca=
n()
> > > --
> > > 2.55.0.1082.g2b9226bbc0-goog
> > >
> > --
> > Jan Kara <jack@suse.com>
> > SUSE Labs, CR

--000000000000c552f3065dbe8eaa
Content-Type: application/x-patch; 
	name="0001-fs-epoll-mark-epoll_wait-tasks-TASK_FREEZABLE.patch"
Content-Disposition: attachment; 
	filename="0001-fs-epoll-mark-epoll_wait-tasks-TASK_FREEZABLE.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mv74e4k40>
X-Attachment-Id: f_mv74e4k40

RnJvbSA1Y2FiZTkyNzg0NTM1ZDhjZDVjYzlkNGI3NmQxODRmMzUzMzg0OGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTYWRydWwgQ2hvd2RodXJ5IDxzYWRydWxAZ29vZ2xlLmNvbT4K
RGF0ZTogVHVlLCAxMyBPY3QgMjAyNiAyMDowODozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0ggMS8y
XSBmcy9lcG9sbDogbWFyayBlcG9sbF93YWl0IHRhc2tzIFRBU0tfRlJFRVpBQkxFCgpEdXJpbmcg
c3lzdGVtIHN1c3BlbmQgKGZyZWV6ZV9wcm9jZXNzZXMpIGFuZCByZXN1bWUgKHRoYXdfcHJvY2Vz
c2VzKSwKdGhyZWFkcyBibG9ja2VkIGluIGVwb2xsX3dhaXQoKSBzbGVlcCBpbiBUQVNLX0lOVEVS
UlVQVElCTEUuIFdoZW4KdHJ5X3RvX2ZyZWV6ZV90YXNrcygpIGV4ZWN1dGVzLCBpdCBtdXN0IHdh
a2UgdXAgZXZlcnkgc2xlZXBpbmcgdGhyZWFkCndpdGggYSBzeW50aGV0aWMgc2lnbmFsIHNvIHRo
ZSB0aHJlYWQgY2FuIHNjaGVkdWxlLCBydW4gdHJ5X3RvX2ZyZWV6ZSgpLAplbnRlciBUQVNLX0ZS
T1pFTiwgYW5kIHNsZWVwIGFnYWluLiBVcG9uIHJlc3VtZSwgdGhlIGZyZWV6ZXIgd2FrZXMgdGhl
bQphbGwgdXAgc2ltdWx0YW5lb3VzbHksIG9ubHkgZm9yIGVhY2ggdGhyZWFkIHRvIHJlLWVudGVy
IGVwX3BvbGwoKSwKb2JzZXJ2ZSBubyByZWFkeSBJL08gZXZlbnRzLCBhbmQgY2FsbCBzY2hlZHVs
ZSgpIHRvIGdvIGJhY2sgdG8gc2xlZXAuCgpPbiBzeXN0ZW1zIHdpdGggbnVtZXJvdXMgZXZlbnQt
ZHJpdmVuIGRhZW1vbnMgKHdoZXJlIGh1bmRyZWRzIG9mCnRocmVhZHMgaWRsZSBpbiBldmVudCBs
b29wcyksIHRoaXMgY2F1c2VzIGEgbGFyZ2Ugd2FrZXVwIHN0YW1wZWRlIGFuZAp0aG91c2FuZHMg
b2YgcmVkdW5kYW50IGNvbnRleHQgc3dpdGNoZXMgcGVyIHN1c3BlbmQvcmVzdW1lIGN5Y2xlLgoK
QW4gZWFybGllciBhdHRlbXB0IHRvIG1ha2UgZXBvbGxfd2FpdCgpIGZyZWV6YWJsZSBpbiBjb21t
aXQgMWM0NDFlOTIxMjAxCigiZXBvbGw6IHVzZSBmcmVlemFibGUgYmxvY2tpbmcgY2FsbCIpIHdh
cyByZXZlcnRlZCBpbiBjb21taXQKYzUxMTg1MWRlMTYyICgiUmV2ZXJ0ICJlcG9sbDogdXNlIGZy
ZWV6YWJsZSBibG9ja2luZyBjYWxsIiIpIGR1ZSB0bwpyZXBvcnRzIG9mIHVzZXJzcGFjZSBjb3Jy
dXB0aW9uIChCdWd6aWxsYSAjNjE3ODEpLiBVbmRlciB0aGUgbGVnYWN5CmZyZWV6ZXIgZGVzaWdu
LCBmcmVlemFibGUgdGFza3MgY291bGQgd2FrZSB1cCBwcmVtYXR1cmVseSB3aGlsZQpoYXJkd2Fy
ZSBhbmQgcGVyaXBoZXJhbCBkcml2ZXJzIHdlcmUgc3RpbGwgc3VzcGVuZGVkLgoKV2l0aCB0aGUg
MjAyMiBjb3JlIGZyZWV6ZXIgcmV3cml0ZSAoY29tbWl0IGY1ZDM5YjAyMDgwOSAoImZyZWV6ZXIs
c2NoZWQ6ClJld3JpdGUgY29yZSBmcmVlemVyIGxvZ2ljIikpLCB0aGUgbGVnYWN5IGZha2Utc2ln
bmFsIG1lY2hhbmlzbSB3YXMKcmVwbGFjZWQgd2l0aCB0aGUgVEFTS19GUk9aRU4gc3RhdGUuIFRh
c2tzIHNsZWVwaW5nIGluIFRBU0tfRlJFRVpBQkxFCmFyZSBzYWZlbHkgZnJvemVuIGluLXBsYWNl
IHdpdGhvdXQgd2FraW5nIHRoZW0gdXAsIGFuZCB0aGUgc2NoZWR1bGVyCmd1YXJhbnRlZXMgdGhl
eSBjYW5ub3QgYmUgd29rZW4gdW50aWwgdGhhd19wcm9jZXNzZXMoKSBleHBsaWNpdGx5IGNsZWFy
cwp0aGUgZnJvemVuIHN0YXRlLgoKTWFyayBzbGVlcGluZyB0YXNrcyBpbiBlcF9wb2xsKCkgYXMg
VEFTS19GUkVFWkFCTEUuIEJlbmNobWFya3Mgb24gYW4KQVJNNjQgdGVzdCBkZXZpY2UgZGVtb25z
dHJhdGUgdGhhdCBjb21iaW5pbmcgdGhpcyB3aXRoIGZyZWV6YWJsZQpzZWxlY3QvcG9sbCByZWR1
Y2VzIHRoYXcgbGF0ZW5jeSBieSA2MyUgKGZyb20gMjAuNjQgbXMgZG93biB0byA3LjU1IG1zCm1l
YW4gYXQgZml4ZWQgQ1BVIGZyZXF1ZW5jeSkgYW5kIHJlZHVjZXMgY29udGV4dCBzd2l0Y2hlcyBk
dXJpbmcKZnJlZXplL3RoYXcgYnkgODclLgoKUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1
c2UuY3o+ClNpZ25lZC1vZmYtYnk6IFNhZHJ1bCBDaG93ZGh1cnkgPHNhZHJ1bEBnb29nbGUuY29t
PgotLS0KIGZzL2V2ZW50cG9sbC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9ldmVudHBvbGwuYyBiL2ZzL2V2
ZW50cG9sbC5jCmluZGV4IDZjYmVmOGI0YzJlMC4uMzU5OTJmNjQ1N2JmIDEwMDY0NAotLS0gYS9m
cy9ldmVudHBvbGwuYworKysgYi9mcy9ldmVudHBvbGwuYwpAQCAtMzksNiArMzksNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L3JjdWxpc3QuaD4KICNpbmNsdWRlIDxsaW51eC9jYXBhYmlsaXR5Lmg+CiAj
aW5jbHVkZSA8bmV0L2J1c3lfcG9sbC5oPgorI2luY2x1ZGUgPGxpbnV4L2ZyZWV6ZXIuaD4KIAog
I2luY2x1ZGUgPHRyYWNlL2hvb2tzL2ZzLmg+CiAKQEAgLTE5ODcsNyArMTk4OCw3IEBAIHN0YXRp
YyBpbnQgZXBfcG9sbChzdHJ1Y3QgZXZlbnRwb2xsICplcCwgc3RydWN0IGVwb2xsX2V2ZW50IF9f
dXNlciAqZXZlbnRzLAogCQkgKiB0aGUgc2FtZSBsb2NrIG9uIHdha2V1cCBlcF9wb2xsX2NhbGxi
YWNrKCkgc2lkZSwgc28gaXQKIAkJICogaXMgc2FmZSB0byBhdm9pZCBhbiBleHBsaWNpdCBiYXJy
aWVyLgogCQkgKi8KLQkJX19zZXRfY3VycmVudF9zdGF0ZShUQVNLX0lOVEVSUlVQVElCTEUpOwor
CQlfX3NldF9jdXJyZW50X3N0YXRlKFRBU0tfSU5URVJSVVBUSUJMRSB8IFRBU0tfRlJFRVpBQkxF
KTsKIAogCQkvKgogCQkgKiBEbyB0aGUgZmluYWwgY2hlY2sgdW5kZXIgdGhlIGxvY2suIGVwX3N0
YXJ0L2RvbmVfc2NhbigpCi0tIAoyLjU2LjAuMzg1LmdkM2FjYjkwZWY4LWdvb2cKCg==
--000000000000c552f3065dbe8eaa
Content-Type: application/x-patch; 
	name="0002-fs-select-mark-select-and-poll-tasks-TASK_FREEZABLE.patch"
Content-Disposition: attachment; 
	filename="0002-fs-select-mark-select-and-poll-tasks-TASK_FREEZABLE.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mv74e4le1>
X-Attachment-Id: f_mv74e4le1

RnJvbSAyM2IwOTNmMGY5ZjI2NmE4MGQzNjcyMjdhOGVmY2U5OTUzZDkwYTdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTYWRydWwgQ2hvd2RodXJ5IDxzYWRydWxAZ29vZ2xlLmNvbT4K
RGF0ZTogVHVlLCAxMyBPY3QgMjAyNiAyMDowODozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0ggMi8y
XSBmcy9zZWxlY3Q6IG1hcmsgc2VsZWN0IGFuZCBwb2xsIHRhc2tzIFRBU0tfRlJFRVpBQkxFCgpT
aW1pbGFyIHRvIGVwb2xsX3dhaXQoKSwgdGhyZWFkcyBzbGVlcGluZyBpbiBkb19zZWxlY3QoKSBh
bmQgZG9fcG9sbCgpCnNsZWVwIGluIFRBU0tfSU5URVJSVVBUSUJMRSB2aWEgcG9sbF9zY2hlZHVs
ZV90aW1lb3V0KCkuIER1cmluZyBzeXN0ZW0Kc3VzcGVuZCBhbmQgcmVzdW1lLCB0aGVzZSB0aHJl
YWRzIGFyZSB3b2tlbiB1cCBieSB0aGUgZnJlZXplciBzb2xlbHkgdG8KdHJhbnNpdGlvbiB0byBU
QVNLX0ZST1pFTiwgYW5kIHdva2VuIGFnYWluIHVwb24gdGhhdyBvbmx5IHRvIHJlLWV2YWx1YXRl
CmZpbGUgZGVzY3JpcHRvcnMgd2l0aCBubyBwZW5kaW5nIGFjdGl2aXR5IGFuZCBzbGVlcCBhZ2Fp
bi4KCkEgcHJldmlvdXMgYXR0ZW1wdCB0byBtYWtlIHNlbGVjdCgpIGFuZCBwb2xsKCkgZnJlZXph
YmxlIGluIGNvbW1pdAo5NzQ1Y2RiMzZkYTggKCJzZWxlY3Q6IHVzZSBmcmVlemFibGUgYmxvY2tp
bmcgY2FsbCIpIHdhcyByZXZlcnRlZCBpbgpjb21taXQgNTk2MTJkMTg3OTEyICgiUmV2ZXJ0ICJz
ZWxlY3Q6IHVzZSBmcmVlemFibGUgYmxvY2tpbmcgY2FsbCIiKQphbG9uZ3NpZGUgdGhlIGVwb2xs
IHJldmVydCBkdWUgdG8gaXNzdWVzIGNhdXNlZCBieSB0aGUgbGVnYWN5IGZyZWV6ZXIKYXJjaGl0
ZWN0dXJlLgoKRm9sbG93aW5nIHRoZSBmcmVlemVyIG92ZXJoYXVsIGluIGNvbW1pdCBmNWQzOWIw
MjA4MDkgKCJmcmVlemVyLHNjaGVkOgpSZXdyaXRlIGNvcmUgZnJlZXplciBsb2dpYyIpLCB0YXNr
cyBpbiBUQVNLX0ZSRUVaQUJMRSBhcmUgc2FmZWx5IGZyb3plbgppbi1wbGFjZSBpbnRvIFRBU0tf
RlJPWkVOIHdpdGhvdXQgcnVubmluZyB1c2Vyc3BhY2UgY29kZSBvciBleHBlcmllbmNpbmcKcHJl
bWF0dXJlIHdha2V1cHMgYmVmb3JlIHJlc3VtZSBjb21wbGV0ZXMuCgpQYXNzIFRBU0tfRlJFRVpB
QkxFIHRvIHBvbGxfc2NoZWR1bGVfdGltZW91dCgpIGluIGRvX3NlbGVjdCgpIGFuZApkb19wb2xs
KCkgKFRBU0tfSU5URVJSVVBUSUJMRSB8IFRBU0tfRlJFRVpBQkxFKSBzbyB0aGF0IHBvbGxpbmcg
dGhyZWFkcwpyZW1haW4gYXNsZWVwIHVuZGlzdHVyYmVkIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZSBj
eWNsZXMuCgpSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KU2lnbmVkLW9mZi1i
eTogU2FkcnVsIENob3dkaHVyeSA8c2FkcnVsQGdvb2dsZS5jb20+Ci0tLQogZnMvc2VsZWN0LmMg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZnMvc2VsZWN0LmMgYi9mcy9zZWxlY3QuYwppbmRleCA4OTQzZjIwZTgz
MDAuLjVjYmJlODYxMzViYyAxMDA2NDQKLS0tIGEvZnMvc2VsZWN0LmMKKysrIGIvZnMvc2VsZWN0
LmMKQEAgLTYwMSw3ICs2MDEsNyBAQCBzdGF0aWMgbm9pbmxpbmVfZm9yX3N0YWNrIGludCBkb19z
ZWxlY3QoaW50IG4sIGZkX3NldF9iaXRzICpmZHMsIHN0cnVjdCB0aW1lc3BlYwogCQkJdG8gPSAm
ZXhwaXJlOwogCQl9CiAKLQkJaWYgKCFwb2xsX3NjaGVkdWxlX3RpbWVvdXQoJnRhYmxlLCBUQVNL
X0lOVEVSUlVQVElCTEUsCisJCWlmICghcG9sbF9zY2hlZHVsZV90aW1lb3V0KCZ0YWJsZSwgVEFT
S19JTlRFUlJVUFRJQkxFIHwgVEFTS19GUkVFWkFCTEUsCiAJCQkJCSAgIHRvLCBzbGFjaykpCiAJ
CQl0aW1lZF9vdXQgPSAxOwogCX0KQEAgLTk2MSw3ICs5NjEsNyBAQCBzdGF0aWMgaW50IGRvX3Bv
bGwoc3RydWN0IHBvbGxfbGlzdCAqbGlzdCwgc3RydWN0IHBvbGxfd3F1ZXVlcyAqd2FpdCwKIAkJ
CXRvID0gJmV4cGlyZTsKIAkJfQogCi0JCWlmICghcG9sbF9zY2hlZHVsZV90aW1lb3V0KHdhaXQs
IFRBU0tfSU5URVJSVVBUSUJMRSwgdG8sIHNsYWNrKSkKKwkJaWYgKCFwb2xsX3NjaGVkdWxlX3Rp
bWVvdXQod2FpdCwgVEFTS19JTlRFUlJVUFRJQkxFIHwgVEFTS19GUkVFWkFCTEUsIHRvLCBzbGFj
aykpCiAJCQl0aW1lZF9vdXQgPSAxOwogCX0KIAlyZXR1cm4gY291bnQ7Ci0tIAoyLjU2LjAuMzg1
LmdkM2FjYjkwZWY4LWdvb2cKCg==
--000000000000c552f3065dbe8eaa--
